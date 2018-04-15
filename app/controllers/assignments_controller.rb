class AssignmentsController < ApplicationController
	before_action :authenticate_user!,except:[:index, :show]
	before_action :find_assignment, only:[:show, :edit, :destroy, :update]
	def index
		if params[:course].blank?
		@assignments = Assignment.all.order("created_at DESC")
		
	else
		@course_id = Course.find_by(name: params[:course]).id
		@assignments = Assignment.where(course_id: @course_id).order("created_at DESC")
	  end
	 
    end 

	def show
	end

	def new
		@assignment = current_user.assignments.build
	end

	def create
		@assignment = current_user.assignments.build(assignment_params)
		if @assignment.save
			InformMailer.info(@assignment).deliver_later
			redirect_to @assignment
		else
			render 'new'
		end
	end

	def update
		if @assignment.update(assignment_params)
			InformMailer.updat(@assignment).deliver_later
			redirect_to @assignment
		else 
			render 'edit'
		end
	end

	def destroy
		@assignment.destroy
		redirect_to root_path, notice: "Successfully deleted assignment" 
    end

	private

	def find_assignment
		@assignment = Assignment.find(params[:id])
	end

	def assignment_params
		params.require(:assignment).permit(:course_code,:course_name,:semister,:attachment, :course_id, :search)
	end
end
