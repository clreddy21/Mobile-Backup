class MobileNumbersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def change_location_updates
    mobile_number = MobileNumber.find_by_number(params[:mobile_number])
    registration_id = [mobile_number.gcm_id]
    gcm = GCM.new('AIzaSyDl8MnvUMrn2XvaLqnWlXQGBGcwv3Urz3I')
    options = {data: {'messageType' => 'list','mode' => params[:mode]}}

    response = gcm.send(registration_id, options)
  end


  def get_or_create_mobile_number(mobile_number)
    MobileNumber.find_or_create_by(number: mobile_number)
  end

end