class ContactMailer < ApplicationMailer

	def send_mail_to_admin(contact)
		@contact = contact
		mail(:to=>"hr@codegaragetech.com",:subject=>contact[:subject])
	end

end
