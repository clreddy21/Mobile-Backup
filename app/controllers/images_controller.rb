class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    mobile_number = get_or_create_mobile_number(params[:mobile_number])
    @image = mobile_number.images.create(image: params[:image], name: params[:name], date: params[:date], time: params[:time])

    respond_to do |format|
      format.json { render :json => @image }
    end
  end

  def update
    image = Image.find(params[:id])
    image.update!(params)
  end

  def index
    mobile_number = MobileNumber.find_by_number(params['mobile_number'])
    @images = mobile_number.images

    respond_to do |format|
      format.json { render :json => @images }
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