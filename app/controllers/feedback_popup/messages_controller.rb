class FeedbackPopup::MessagesController < ApplicationController
  def create
    message = FeedbackPopup::Message.new(message_params)
    if message.deliver
      @success_message = t('feedback_popup.message_sent')
    else
      @error_message = message.errors.full_messages.join("; ")
    end
    respond_to do |format|
      format.html {
        flash[:notice] = @success_message if @success_message
        flash[:alert] = @error_message if @error_message
        redirect_to root_url
      }
      format.js {
        render :layout => nil
      }
    end
  end

  private

  def message_params
    params[:feedback_popup_message].slice(:body)
  end
end
