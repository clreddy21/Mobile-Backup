class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    mobile_number = get_or_create_mobile_number(params[:mobile_number])
    @message = mobile_number.messages.create(from_name: params[:from_name], to_name: params[:to_name],
                                             from_number: params[:from_number],
                                             to_number: params[:to_number],
                                             message: params[:message],
                                             date: params[:date],
                                             time: params[:time]
                                             )

    respond_to do |format|
      format.json { render :json => @message }
    end
  end

  def update
    message = Message.find(params[:id])
    message.update!(params)
  end

  def index
    mobile_number = MobileNumber.find_by_number(params['mobile_number'])
    @messages = mobile_number.messages

    respond_to do |format|
      format.json { render :json => @messages }
    end

  end

  def show

  end

  def delete

  end

  def get_or_create_mobile_number(mobile_number)
    MobileNumber.find_or_create_by(number: mobile_number)
  end

end