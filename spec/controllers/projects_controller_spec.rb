require 'rails_helper'
require 'spec_helper'

describe ProjectsController do
	let(:user) { FactoryGirl.create(:user) }
	let(:project) { FactoryGirl.create(:project) }

	context "standard users" do
		before do
			login(user)
		end

		{ new: :get, create: :post, edit: :get, update: :put, destroy: :delete }.each do |action, method|
			it "cannot access #{action} action" do
				send(method, action, :id => project.id)

				expect(response).to redirect_to("/")
				expect(flash[:notice].to eql("Admin account required."))
			end
		end
	end
end