require 'spec_helper'
require 'rails_helper'

feature "signing in" do
	scenario "via homepage link with form" do
		user = FactoryGirl.create(:user)

		visit "/"
		click_link "Login"
		fill_in "login_username", with: user.username
		fill_in "login_password", with: user.password
		click_button "Login"

		expect(page).to have_content("Hi, #{user.username}!")
	end
end