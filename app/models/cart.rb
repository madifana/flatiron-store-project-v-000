class Cart < ActiveRecord::Base
   belongs_to :user
   has_many :line_items
   has_many :items, through: :line_items

   def add_item(item_id)
      line_item = line_items.find_by(item_id: item_id)
      if line_item
        line_item.quantity += 1
        line_item
      else
        line_item = line_items.new(item_id: item_id, quantity: 1)
      end
   end

   def total
     price_array = line_items.collect do |line_item|
       line_item.quantity * line_item.item.price
     end
   price_array.inject(:+)
   end
  end
