# spec/controllers/contacts_controller_spec.rb
require 'spec_helper'
describe ContactsController do
  describe "GET #index" do
    it "populates an array of contacts"
#    do
#      contact = FactoryGirl.create(:contact)
#      get :index
#      assigns(:contacts).should eq([contact])
#    end
#    it "renders the :index view" do
#      get :index
#      response.should render_template :index
#    end
  end
  
#  describe "GET #show" do
#    it "assigns the requested contact to @contact" do
#      contact = FactoryGirl.create(:contact)
#      get :show, id: contact
#      assigns(:contact).should eq(contact)
#    end
#    it "renders the :show view" do
#      get :show, id: FactoryGirl.create(:contact)
#      response.should render_template :show
#    end
#    
#  end
#  describe "GET #new" do
#    it "assigns a home, office, and mobile phone to the new contact" do
#      get :new
#      assigns(:contact).phones.map{ |p| p.phone_type }.should eq %w(home office mobile)
#    end
#    
#    it "renders the :new template"
#  end
#  describe "POST #create" do
#    context "with valid attributes" do
#      it "creates a new contact" do
#        expect{
#          post :create, contact: FactoryGirl.attributes_for(:contact)
#        }.to change(Contact,:count).by(1)
#      end
#      it "redirects to the home page" do
#        post :create, contact: FactoryGirl.attributes_for(:contact)
#        response.should redirect_to Contact.last
#      end
#    end
#    context "with invalid attributes" do
#      it "does not save the new contact" do
#        expect{
#          post :create, contact: FactoryGirl.attributes_for(:invalid_contact)
#        }.to_not change(Contact,:count)
#      end
#      it "re-renders the new method" do
#        post :create, contact: Factory.attributes_for(:invalid_contact)
#        response.should render_template :new
#      end
#    end
#  end
  
#  describe 'PUT update' do
#    before :each do
#      @contact = Factory(:contact, firstname: "Lawrence", lastname: "Smith")
#    end
#    
#    context "valid attributes" do
#      it "located the requested @contact" do
#        put :update, id: @contact, contact: Factory.attributes_for(:contact)
#        assigns(:contact).should eq(@contact)
#      end
#      it "changes @contact's attributes" do
#        put :update, id: @contact, contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: "Smith")
#        @contact.reload
#        @contact.firstname.should eq("Larry")
#        @contact.lastname.should eq("Smith")
#      end
#      it "redirects to the updated contact" do
#        put :update, id: @contact, contact: Factory.attributes_for(:contact)
#        response.should redirect_to @contact
#      end
#      
#    end
#    context "invalid attributes" do
#      it "locates the requested @contact" do
#        put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
#        assigns(:contact).should eq(@contact)
#      end
#      it "does not change @contact's attributes" do
#        put :update, id: @contact, contact: Factory.attributes_for(:contact, firstname: "Larry", lastname: nil)
#        @contact.reload
#        @contact.firstname.should_not eq("Larry")
#        @contact.lastname.should eq("Smith")
#      end
#      it "re-renders the edit method" do
#        put :update, id: @contact, contact: Factory.attributes_for(:invalid_contact)
#        response.should render_template :edit
#      end
#      
#    end
#  end
#  describe 'DELETE destroy' do
#    before :each do
#      @contact = Factory(:contact)
#    end
#    it "deletes the contact" do
#      expect{
#        delete :destroy, id: @contact
#      }.to change(Contact,:count).by(-1)
#    end
#    
#    it "redirects to contacts#index" do
#      delete :destroy, id: @contact
#      response.should redirect_to contacts_url
#    end
#  end
end