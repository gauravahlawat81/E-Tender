class ChangeUserIdToBigintInDoc1s < ActiveRecord::Migration[6.0]
  def change
  	  change_column :doc1s, :user_id, :bigint
  end
end
