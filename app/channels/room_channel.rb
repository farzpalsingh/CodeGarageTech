class RoomChannel < ApplicationCable::Channel
  def subscribed
    if current_user.present?
      stream_from "room_channel_#{current_user.id}"
    elsif ip_address.present?
      generated_password = Devise.friendly_token.first(8)
      anonymous_user = User.find_by(ip_address: ip_address)
      if !anonymous_user.present?
        anonymous_user = User.create!(email: ip_address.to_s + "@anonymous.com", password: generated_password, ip_address: ip_address, user_type: "anonymous_user")
      end
      stream_from "room_channel_#{anonymous_user.id}"
    end
    # stream_from "room_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end
    Message.create(message_params)
  end
end
