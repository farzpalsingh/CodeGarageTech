class ContactMailer < ApplicationMailer

	def send_mail_to_admin(contact)
		@contact = contact[0]
		mail(:to=>"birparam95@gmail.com",:subject=>@contact["subject"])
	end

	def resume_to_hr(resume_details,resume_url)
		# debugger
		@resume_details = resume_details
		attachments['Resume.pdf'] = File.read(resume_url)
		mail(:to=>"birparam95@gmail.com",:subject=>"Resume Details")
	end

	def resume_to_hr(resume_details,resume_url)
		# debugger
		@resume_details = resume_details
		attachments['Resume.pdf'] = File.read(resume_url)
		mail(:to=>"birparam95@gmail.com",:subject=>"Resume Details")
	end

end
