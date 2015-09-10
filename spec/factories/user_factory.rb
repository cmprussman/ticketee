require 'spec_helper'
require 'rails_helper'

FactoryGirl.define do
	factory :user do
		username "TestUser"
		email "test@gmail.com"
		password "abc"

		factory :admin_user do
			admin true
		end
	end
end