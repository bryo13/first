class InformMailer < ApplicationMailer
	default from: 'bryo@tum.com'

	def info(assignment)
		@assignment = assignment
		mail(to:"class@rep.com", subject:"Posted assignment")
	end

	def updat(assignment)
		@assignment = assignment
		mail(to:"class@rep.com", subject:"Updated assignment")
	end
end
