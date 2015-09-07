require "rails_helper"
require "spec_helper"

feature "viewing tickets" do
	scenario "all tickets" do
		user = FactoryGirl.create(:user)
		project = FactoryGirl.create(:project)
		ticket = FactoryGirl.create(:ticket, project: project)
		ticket.update(user: user)

		visit "/"
		click_link project.name

		within("li") do
			expect(page).to have_content("Test Ticket")
		end
	end
end