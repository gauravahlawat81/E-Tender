class Doc1 < ApplicationRecord
  belongs_to :tender
	enum status: { draft: 0, locked: 1}  
end
