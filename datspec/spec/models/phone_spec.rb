require 'spec_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contact" do
    contact = FactoryGirl.create(:contact)
    FactoryGirl.create(:phone, contact: contact, phone_type: "home", phone: "785-555-1234").should be_valid
    FactoryGirl.build(:phone, contact: contact, phone_type: "mobile", phone: "785-555-1234").should_not be_valid
  end
end
