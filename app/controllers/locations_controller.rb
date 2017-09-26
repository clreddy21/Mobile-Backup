class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    mobile_number = get_or_create_mobile_number(params[:mobile_number])
    @location = mobile_number.locations.create(latitude: params[:latitude], longitude: params[:longitude],
                                               date: params[:date], time: params[:time])

    respond_to do |format|
      format.json { render :json => @location }
    end
  end

  def update
    location = Location.find(params[:id])
    location.update!(params)

    respond_to do |format|
      format.json { render :json => location }
    end

  end

  def index
    mobile_number = MobileNumber.find_by_number(params['mobile_number'])
    @locations = mobile_number.locations

    respond_to do |format|
      format.json { render :json => @locations }
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