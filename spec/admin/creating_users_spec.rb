require 'spec_helper'
require 'rails_helper'

feature "Creating users" do
	let!(:admin) { FactoryGirl.create(:admin_user) }

	before do
		login_as!(admin)
		visit "/"

		click_link "Admin"
		click_link "Users"
		click_link "New User"
	end

	scenario "new user" do
		fill_in "Username", with: "TestUser"
		fill_in "Email", with: "test@gmail.com"
		fill_in "Password", with: "abc"
		fill_in "Password confirmation", with: "abc"
		click_button "Submit"

		expect(page).to have_content("User created.")
	end
end