class AddForeignKeyToDoc1 < ActiveRecord::Migration[6.0]
  def change
  	add_foreign_key :doc1s, :users
  end
end
