class AddingReadToMessagesAndConversations < ActiveRecord::Migration
  def change
  	add_column :messages, :was_read, :boolean
  	add_column :conversations, :v_read, :boolean
  	add_column :conversations, :t_read, :boolean
  end
end
