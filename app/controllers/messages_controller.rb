class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :new]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @report = Report.find(params[:report_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.report = @report
    if @message.submit_message_date.nil?
      @message.submit_message_date = Date.today
    end
    # binding.pry
    if @message.save
      respond_to do |format|
       format.html { redirect_to report_path(@report) }
       format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      render :new
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:date, :note)
  end
end
