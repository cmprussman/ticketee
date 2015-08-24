class Project < ActiveRecord::Base
	has_many :tickets, dependent: :delete_all
end
