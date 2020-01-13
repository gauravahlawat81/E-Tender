class AddNotNullToApprove < ActiveRecord::Migration[6.0]
  def change
change_column_null(:conversations, :approve, false)  #change_column :conversations, :approve, :interger, null: false
  end
end
