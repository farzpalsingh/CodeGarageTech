class ResumeToHr < ApplicationJob
  queue_as :default

  def perform(args,resume_path)
  	ContactMailer.resume_to_hr(args,resume_path).deliver
    # Do something later
  end
end
