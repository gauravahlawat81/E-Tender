class CreateDoc6s < ActiveRecord::Migration[6.0]
  def change
    create_table :doc6s do |t|
      t.references :tender, null: false, foreign_key: true
      t.string :debit_head
      t.string :item_name
      t.string :type
      t.integer :number_bids_received
      t.integer :number_bidder_representative
      t.integer :number_of_bids_accepted
      t.text :name_of_accepted_firms
      t.integer :number_of_bids_rejected
      t.text :name_of_rejected_firms
      t.date :date_of_financial_bid_opening

      t.timestamps
    end
  end
end
