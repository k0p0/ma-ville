class MessagesController < ApplicationController
  before_action set_message, only: [:show, :new]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:date, :note, :report_id, :user_id)
  end
end
