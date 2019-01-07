class MessagesController < ApplicationController
	def create
		if current_user.present?
	    	@conversation = Conversation.includes(:recipient).find(params[:conversation_id])
	    	@message = @conversation.messages.create(body: params[:message][:body], user_id: current_user.id)
	    else
	    	address = request.remote_ip
      		anonymous_user = User.find_by(ip_address: address)
	    	@conversation = Conversation.includes(:recipient).find(params[:conversation_id])
	    	@message = @conversation.messages.create(body: params[:message][:body], user_id: anonymous_user.id)
	    end
    	respond_to do |format|
      		format.js
    	end
  	end

  	private

  	def message_params
    	params.require(:message).permit(:body)
  	end
end
