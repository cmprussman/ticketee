require 'spec_helper'
require 'rails_helper'

describe Admin::UsersController do
	let(:user) { FactoryGirl.create(:user) }

	context "regular users" do
		before { login(user) }

		it "can't access index action" do
			get "index"
			expect(response).to redirect_to("/")
			expect(flash[:notice]).to eql("Admin account required.")
		end
	end
end