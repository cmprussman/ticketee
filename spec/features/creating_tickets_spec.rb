require 'rails_helper'
require 'spec_helper'

feature "creating tickets" do
	before do
		FactoryGirl.create(:project)

		visit "/"
		click_link "Test Project"
		click_link "New Ticket"
	end

	scenario "success" do
		fill_in "Title", with: "Test Title"
		fill_in "Description", with: "Test description"
		click_button "Submit"

		expect(page).to have_content("Ticket created.")
	end

	scenario "description has less than 10 characters" do
		fill_in "Title", with: "Test Title"
		fill_in "Description", with: "Test"
		click_button "Submit"

		expect(page).to have_content("Error creating ticket.")
		expect(page).to have_content("Description is too short")
	end

	scenario "fields cannot be empty" do
		click_button "Submit"

		expect(page).to have_content("Error creating ticket.")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Description can't be blank")
	end
end