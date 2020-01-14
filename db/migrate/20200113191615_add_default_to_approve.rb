class AddDefaultToApprove < ActiveRecord::Migration[6.0]
  def change
	change_column_default(
  		:conversations,
  		:approve,
  		0
		)
  end
end
