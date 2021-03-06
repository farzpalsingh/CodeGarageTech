# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	# identified_by :current_user
 
   #  def connect
   #    self.current_user = find_verified_user
   #    logger.add_tags 'ActionCable', current_user.email
   #  end
 
   #  protected
 
   #  def find_verified_user
   #    if (current_user = env['warden'].user)
   #      current_user
   #    else
   #      reject_unauthorized_connection
   #    end
   #  end

   	identified_by :current_user, :ip_address


	def connect
	   	if !env['warden'].user
	     	self.ip_address = request.remote_ip
	   	else
	     	self.current_user = find_verified_user
	   	end

	end

	protected

	def find_verified_user # this checks whether a user is authenticated with devise
	  	if verified_user = env['warden'].user
	     	verified_user
	   	else
	     	reject_unauthorized_connection
	   	end
	end

  end
end
