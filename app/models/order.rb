class Order < ActiveRecord::Base
	belongs_to :from, :class_name => "Organization"
	belongs_to :to, :class_name => "Organization"
	belongs_to :recipient, :class_name => "Organization"
	belongs_to :bankacc

	belongs_to :parent, :class_name => 'Order'
	has_many :children, :class_name => 'Order', :foreign_key => 'parent_id'

	has_many :order_lines

	has_one :warrant

	def to_label
		" #: #{number}"
	end

	def total_price
		order_lines.sum("price*qty")
	end

end
