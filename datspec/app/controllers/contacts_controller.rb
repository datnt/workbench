class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    if params[:letter]
      @contacts = Contact.by_letter(params[:letter])
    else
      @contacts = Contact.order("lastname, firstname")
    end
  end
  def new
    @contact = Contact.new
    %w(home office mobile).each do |phone| 
      @contact.phones.build(phone_type: phone) 
    end
  end
end
