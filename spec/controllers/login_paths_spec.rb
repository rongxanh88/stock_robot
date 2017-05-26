require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "user can login" do
    it "sets the correct user id" do
      user = create(:user)
      get :create, {:params => {:user => {:email_address => user.email_address, :password => user.password}}}

      expect(request.session[:user_id]).to be(user.id)
    end
  end
end