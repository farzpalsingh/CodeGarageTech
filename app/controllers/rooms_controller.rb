class RoomsController < ApplicationController
	layout "chat"
	before_action :authenticate_user!, except: [:index]

	def show
	  	session[:conversations] ||= []

    	@anonymous_users = User.where(user_type: 'anonymous_user')
    	@conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
	end

	def index
		address = request.remote_ip
		anonymous_user = User.find_by(ip_address: address)
		if anonymous_user.present?
			user = User.find_by_user_type('admin')
      		@conversation = Conversation.getConversation(anonymous_user.id, user.id)
		else
			@conversation = nil
		end
	end
end