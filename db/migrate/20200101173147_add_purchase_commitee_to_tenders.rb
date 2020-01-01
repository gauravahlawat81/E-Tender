class AddPurchaseCommiteeToTenders < ActiveRecord::Migration[6.0]
  def change
  	add_column :tenders , :purchase_commitee , :bigint
  end
end
