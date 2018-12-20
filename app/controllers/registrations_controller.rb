class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    user = resource
    send_welcome_message(user)
    recipes_path(resource)
  end

  def send_welcome_message(user)
    welcome_message = PrivateMessage.new
    welcome_message.body = "Welcome to Hell"
    welcome_message.receiver = user
    welcome_message.sender = User.find(1)
    welcome_message.save
  end
end
