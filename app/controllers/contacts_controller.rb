class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    mobile_number = get_or_create_mobile_number(params[:mobile_number])
    @contact = mobile_number.contacts.create(number: params[:number], name: params[:name], email: params[:email])

    respond_to do |format|
      format.json { render :json => @contact }
    end
  end

  def update
    contact = Contact.find(params[:id])
    contact.update!(params)
  end

  def index
    mobile_number = MobileNumber.find_by_number(params['mobile_number'])
    @contacts = mobile_number.contacts

    respond_to do |format|
      format.json { render :json => @contacts }
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