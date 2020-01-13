class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
    	t.string :title
    	t.string :body
    	t.bigint :sender_id
    	t.bigint :receiver_id
    	t.bigint :tender_id
    	t.integer :type_of_message, null: false, default: 0
    	t.bigint :nominee
    	t.string :remark
    	t.integer :approve
      t.timestamps
    end
  end
end
