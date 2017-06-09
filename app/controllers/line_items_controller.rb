class LineItemsController < ApplicationController

 def create
   if !current_user.current_cart #creates a new cart
     current_user.current_cart = Cart.create
     current_user.save
   end

   item_added = current_user.current_cart.add_item(params[:item_id]) # <-- returns a line item record
   item_added.save
   redirect_to cart_path(current_user.current_cart)
 end
end
