class AddProfileToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :first_name, :string
    add_column :volunteers, :last_name, :string
    add_column :volunteers, :interests, :string
    add_column :volunteers, :profile_complete, :boolean
  end
end
