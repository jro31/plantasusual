class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    user = resource
    send_welcome_message(user)
    recipes_path(resource)
  end

  def send_welcome_message(user)
    welcome_message = PrivateMessage.new
    if user.first_name != ""
      welcome_message.body = "Welcome to Plant as Usual #{user.first_name}.\n\nIf you know any plant-based recipes, please share them with the community.\n\nMessage me here if you have any problems or suggestions for the site.\n\nHappy cooking!\n\nJethro."
    else
      welcome_message.body = "Welcome to Plant as Usual #{user.username}.\n\nIf you know any plant-based recipes, please share them with the community.\n\nMessage me here if you have any problems or suggestions for the site.\n\nHappy cooking!\n\nJethro."
    end
    welcome_message.receiver = user
    welcome_message.sender = User.find(1)
    welcome_message.save
  end
end
