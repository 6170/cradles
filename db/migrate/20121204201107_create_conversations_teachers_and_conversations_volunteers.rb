class CreateConversationsTeachersAndConversationsVolunteers < ActiveRecord::Migration
  def change
  	create_table :conversations_teachers, :id => false do |t|
      t.integer :conversation_id
      t.integer :teacher_id
    end
    create_table :conversations_volunteers, :id => false do |t|
      t.integer :conversation_id
      t.integer :volunteer_id
    end
  end
end
