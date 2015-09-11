require 'spec_helper'
require 'rails_helper'

feature "hidden links" do
	before do
		let(:user) { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin_user) }
		let(:project) { FactoryGirl.create(:project) }
		visit "/"
	end

	context "anonymous users" do
		scenario "can't see New Project link" do
			expect(page).to_not have_link("New Project")
		end

		scenario "can't see Edit Project link" do
			expect(page).to_not have_link("Edit Project")
		end

		scenario "can't see Delete Project link" do
			expect(page).to_not have_link("Delete Project")
		end
	end

	context "regular users" do
		before { login_as!(user) }
		scenario "can't see New Project link" do
			expect(page).to_not have_link("New Project")
		end

		scenario "can't see Edit Project link" do
			expect(page).to_not have_link("Edit Project")
		end

		scenario "can't see Delete Project link" do
			expect(page).to_not have_link("Delete Project")
		end
	end

	context "admin users" do
		before { login_as!(admin) }
		scenario "can see New Project link" do
			expect(page).to have_link("New Project")
		end

		scenario "cant see Edit Project link" do
			expect(page).to have_link("Edit Project")
		end

		scenario "cant see Delete Project link" do
			expect(page).to have_link("Delete Project")
		end
	end
end