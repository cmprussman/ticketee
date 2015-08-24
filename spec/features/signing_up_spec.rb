require 'spec_helper'
require 'ruby_helper'

feature "Signing up" do
	scenario "success" do
		visit "/"

		click_link "Sign up"
		fill_in "Email", with: "test@gmail.com"
		fill_in "Username", with: "TestUser"
		fill_in "Password", with: "abc"
		click_button "Submit"

		expect(page).to have_content("Welcome, TestUser!")
	end
end