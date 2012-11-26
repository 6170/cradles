class SchoolsVolunteers < ActiveRecord::Migration
  def change
    create_table :schools_volunteers, :id => false do |t|
      t.integer :school_id
      t.integer :volunteer_id
    end
    add_index(:schools_volunteers, [:school_id, :volunteer_id])
  end
end
