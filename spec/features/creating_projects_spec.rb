require 'rails_helper'
require 'spec_helper'

feature 'Creating Projects' do 
	before do
		login_as!(FactoryGirl.create(:admin_user))
	end
	scenario 'can create project' do
		visit '/'
		click_link 'New Project'
		fill_in 'Name', with: 'Proj Name'
		fill_in 'Description', with: 'Testing description'
		click_button 'Create Project'
		expect(page).to have_content('Project has been created.')
	end
end