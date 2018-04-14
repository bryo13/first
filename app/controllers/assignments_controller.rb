class AssignmentsController < ApplicationController

	before_action :find_assignment, only:[:show, :edit, :destroy, :update]
	def index
		@assignments = Assignment.all
	end

	def show
	end

	def new
		@assignment = Assignment.new
	end

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save
			redirect_to @assignment
		else
			render 'new'
		end
	end

	def update
		if @assignment.update(assignment_params)
			redirect_to @assignment
		else 
			render 'edit'
		end
	end

	private

	def find_assignment
		@assignment = Assignment.find(params[:id])
	end

	def assignment_params
		params.require(:assignment).permit(:course_code,:course_name,:semister,:attachment)
	end
end
