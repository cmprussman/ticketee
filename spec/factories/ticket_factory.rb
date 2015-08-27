require 'spec_helper'
require 'rails_helper'

FactoryGirl.define do
	factory :ticket do
		title "Test Ticket"
		description "Test description"
	end
end