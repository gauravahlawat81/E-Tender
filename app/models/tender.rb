class Tender < ApplicationRecord
  has_many :doc2s
  has_many :doc10s
  has_many :doc9s
  has_many :doc7s
  has_many :doc6s
  has_many :doc5s
  has_many :doc1s
	belongs_to :user
	enum status: { draft: 0, published: 1,locked: 2}
	serialize :purchase_commitee

	def self.serialized_attr_accessor(*args)
    	args.each do |method_name|
    	  eval "
        	def #{method_name}
        	  (self.purchase_commitee || {})[:#{method_name}]
        	end
        	def #{method_name}=(value)
        	  self.purchase_commitee ||= {}
        	  self.purchase_commitee[:#{method_name}] = value
        	end
        	 attr_accessor :#{method_name}
    	  "
    end
  end

  serialized_attr_accessor :pcm1, :pcm2, :pcm3, :pcm4,:pcm5,:pcm6,:pcm7
end
