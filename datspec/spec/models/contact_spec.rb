# spec/models/contact.rb
require 'spec_helper'
describe Contact do
  
  it "has a valid factory" do
    FactoryGirl.create(:contact).should be_valid
  end

  it "is invalid without a firstname" do 
    FactoryGirl.build(:contact, firstname: nil).should_not be_valid
  end
  it "is invalid without a lastname"do 
    FactoryGirl.build(:contact, lastname: nil).should_not be_valid
  end
  it "returns a contact's full name as a string" do
    contact = FactoryGirl.create(:contact, firstname: "John", lastname: "Doe")
    contact.name.should == "John Doe"
  end
  describe "filter last name by letter" do
    before :each do
      @smith = FactoryGirl.create(:contact, lastname: "Smith")
      @jones = FactoryGirl.create(:contact, lastname: "Jones")
      @johnson = FactoryGirl.create(:contact, lastname: "Johnson")
    end
    context "matching letters" do
      it "returns a sorted array of results that match" do
        Contact.by_letter("J").should == [@johnson, @jones]
      end
    end
    
    context "non-matching letters" do
      it "returns a sorted array of results that match" do
        Contact.by_letter("J").should_not include @smith
      end
    end
  end
  
end

