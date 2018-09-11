class ContactsController < ApplicationController

	def index
	end

	def create
    	# @contact=Contact.new(contact_params)

     	# if @contact.save
     		# cont_email=@new_contact_us.email
     		# cont_name=@new_contact_us.name
     		# MailUserMailer.send_mail_to_user(cont_email).deliver
        	# ContactMailer.send_mail_to_admin(contact_params).deliver
            SendMailToHrJob.perform_later contact_params.as_json
     		# flash[:notice] = "Your message has been sent"
        # else
            # flash[:notice]=@contact.errors.full_messages
        # end

        redirect_to contact_path
    end

    private
  	
  	def contact_params
    	params.require(:contact).permit(:name,:email,:subject,:message)
  	end

end
