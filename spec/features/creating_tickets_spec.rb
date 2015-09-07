require 'rails_helper'
require 'spec_helper'

feature "creating tickets" do
	before do
		@project = FactoryGirl.create(:project)
		@user = FactoryGirl.create(:user)

		# Click "New Ticket", and must show "login" message when ther is no session.
		visit "/"
		click_link @project.name
		click_link "New Ticket"

		expect(page).to have_content("Please login.")

		# Login in order to create a ticket.
		login_as!(@user)
		click_link @project.name
		click_link "New Ticket"
	end

	scenario "success" do
		fill_in "ticket_title", with: "Test Title"
		fill_in "ticket_description", with: "Test description"
		click_button "Submit"

		expect(page).to have_content("Ticket created.")
		within ".author" do
			expect(page).to have_content("Added by #{@user.username}")
		end
	end

	scenario "description has less than 10 characters" do
		fill_in "ticket_title", with: "Test Title"
		fill_in "ticket_description", with: "Test"
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