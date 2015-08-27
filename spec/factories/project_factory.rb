require 'spec_helper'
require 'rails_helper'

FactoryGirl.define do
	factory :project do
		name "Test Project"
		description "Test description"
	end
end