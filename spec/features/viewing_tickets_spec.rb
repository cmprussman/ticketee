require "rails_helper"
require "spec_helper"

feature "viewing tickets" do
	scenario "all tickets" do
		project = FactoryGirl.create(:project)
		ticket = FactoryGirl.create(:ticket)

		visit "/"

		within("li") do
			expect(page).to have_content("Test Ticket")
		end
	end
end