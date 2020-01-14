class AddUserIdToDoc1s < ActiveRecord::Migration[6.0]
  def change
  	add_column :doc1s , :user_id , :bigint , null: false
  end
end
