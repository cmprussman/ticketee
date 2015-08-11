class AddNameDescriptionToProjects < ActiveRecord::Migration
  def up
  	add_column :projects, :name, :string
  	add_column :projects, :description, :text
  end

  def down
  	remove_column :projects, :name
  	remove_column :projects, :description
  end
end
