class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    @contacts = []
    params[:_json].each do |params|
      mobile_number = get_or_create_mobile_number(params[:mobile_number])

      contact = mobile_number.contacts.where(:number => params[:number]).first
      if contact.blank?
        @contact = mobile_number.contacts.create(number: params[:number], name: params[:name], email: params[:email], source: params[:source])
      else


        name = (contact.name.to_s == params[:name]) ? contact.name.to_s : (contact.name.to_s + ', ' +params[:name])
        email = (contact.email.to_s == params[:email]) ? contact.email.to_s : (contact.email.to_s + ', ' +params[:email])
        name = (contact.source.to_s == params[:source]) ? contact.source.to_s : (contact.source.to_s + ', ' +params[:source])

        contact.update(name: name, email: email, source: source)

        @contact = contact
      end
      @contacts << @contact
    end

    respond_to do |format|
      format.json { render :json => @contacts.uniq }
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