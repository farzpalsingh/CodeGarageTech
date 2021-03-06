class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_ability
	@current_ability ||= Ability.new(current_admin)
  end
  
  def self.render_with_signed_in_user(user, *args)
	   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
	   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
	   renderer = self.renderer.new('warden' => proxy)
	   renderer.render(*args)
	end
end
