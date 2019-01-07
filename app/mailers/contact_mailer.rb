class ContactMailer < ApplicationMailer

	def send_mail_to_admin(contact)
		@contact = contact[0]
		mail(:to=>"info@codegaragetech.com,service@codegaragetech.com",:subject=>"via CodeGarageTech")
		# mail(:to=>"service@codegaragetech.com",:subject=>"via CodeGarageTech")
	end

	def resume_to_hr(resume_details,resume_url)
		@resume_details = resume_details
		attachments['Resume.pdf'] = File.read(resume_url)
		mail(:to=>"info@codegaragetech.com,service@codegaragetech.com",:subject=>"Resume Details")
		# mail(:to=>"service@codegaragetech.com",:subject=>@contact["subject"])

	end

	# def resume_to_hr(resume_details,resume_url)
	# 	@resume_details = resume_details
	# 	attachments['Resume.pdf'] = File.read(resume_url)
	# 	mail(:to=>"info@codegaragetech.com",:subject=>"Resume Details")
	# 	mail(:to=>"service@codegaragetech.com",:subject=>@contact["subject"])

	# end

end
