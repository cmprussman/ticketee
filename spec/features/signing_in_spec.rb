require 'spec_helper'
require 'ruby_helper'

feature "signing in" do
	scenario "via homepage link with form" do
		user = FactoryGirl.create(:user)

		visit "/"
		click_link "Login"
		fill_in "Username", with: user.username
		fill_in "Password", with: user.password
		click_button "Submit"

		expect(page).to have_content("Hi, " + user.username)
	end
end