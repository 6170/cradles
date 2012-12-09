class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :volunteer_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
