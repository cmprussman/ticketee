require "rails_helper"
require "spec_helper"

feature "viewing tickets" do
	scenario "all tickets" do
		user = FactoryGirl.create(:user)
		project = FactoryGirl.create(:project)
		ticket = FactoryGirl.create(:ticket)
		ticket.update(user: user)

		visit "/"

		within("li") do
			expect(page).to have_content("Test Ticket")
		end
	end
end