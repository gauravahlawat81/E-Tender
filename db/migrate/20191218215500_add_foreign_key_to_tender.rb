class AddForeignKeyToTender < ActiveRecord::Migration[6.0]
  def change
  	add_foreign_key :tenders, :users
  end
end
