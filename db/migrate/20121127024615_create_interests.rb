class CreateInterests < ActiveRecord::Migration
  def change
  	create_table :interests do |t|
      t.string :name
      t.timestamps
    end
    create_table :interests_volunteers, :id => false do |t|
      t.integer :interest_id
      t.integer :volunteer_id
    end
    add_index(:interests_volunteers, [:interest_id, :volunteer_id])
  end
end
