class SendMailToHrJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	ContactMailer.send_mail_to_admin(args).deliver

    # Do something later
  end
end
