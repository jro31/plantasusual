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

  def index
    @search_bar_hide = true
    @private_messages = policy_scope(PrivateMessage).order(created_at: :desc)
    @user = current_user
  end

  def show
    @search_bar_hide = true
    @clicked_message = PrivateMessage.find(params[:id])
    authorize @clicked_message
    @user_messages = PrivateMessage.where(receiver: current_user).or(PrivateMessage.where(sender: current_user))

    if @clicked_message.sender != current_user
      @other_person = @clicked_message.sender
    elsif @clicked_message.receiver != current_user
      @other_person = @clicked_message.receiver
    else
      redirect_to root_path
      flash[:alert] = "Something just went wrong"
    end
    @message_string = @user_messages.where(receiver: @other_person).or(@user_messages.where(sender: @other_person)).order(created_at: :desc)
  end
end

private

def private_message_params
  params.require(:private_message).permit(:body)
end
