class ConversationsController < ApplicationController
	
	def create
		if current_user.present?
	    	@conversation = Conversation.get(current_user.id, params[:user_id])
	    	add_to_current_conversation	    
	    	add_to_conversations unless conversated?
	    else
	    	address = request.remote_ip
	    	generated_password = Devise.friendly_token.first(8)
	    	anonymous_user = User.find_by(ip_address: address)
	    	if !anonymous_user.present?
	    		anonymous_user = User.create!(email: address.to_s + "@anonymous.com", password: generated_password, ip_address: address, user_type: "anonymous_user")
	    	end
      		user = User.find_by_user_type('admin')
	    	@conversation = Conversation.get(anonymous_user.id, user.id)
	    end
	    respond_to do |format|
	      	format.js
	    end
	end
	 
	private

	def add_to_current_conversation
		session[:conversation] = nil
		session[:conversation] = @conversation.id
	end
	 
	def add_to_conversations
	    session[:conversations] ||= []
	    session[:conversations] << @conversation.id
	end
	 
	def conversated?
	    session[:conversations].include?(@conversation.id)
	end
end
