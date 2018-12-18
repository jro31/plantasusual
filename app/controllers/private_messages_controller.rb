class PrivateMessagesController < ApplicationController
  def new
    @search_bar_hide = true
    @private_message = PrivateMessage.new
    @profile = Profile.find(params[:profile_id])
    @receiver = @profile.user
    authorize @private_message
  end

  def create
    @private_message = PrivateMessage.new(private_message_params)
    @sender = current_user
    @profile = Profile.find(params[:profile_id])
    @receiver = @profile.user
    @private_message.sender = @sender
    @private_message.receiver = @receiver
    authorize @private_message
    if @private_message.valid?
      @private_message.save
      flash[:notice] = "Message sent"
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end
end

private

def private_message_params
  params.require(:private_message).permit(:topic, :body)
end
