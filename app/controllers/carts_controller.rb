class CartsController < ApplicationController
 def show
   @cart = Cart.find(params[:id])
 end

 def checkout
   @cart = Cart.find(params[:id])
   @cart.update(status: 'submitted')
   @cart.line_items.each do |line_item|
     line_item.item.remove(line_item.quantity)
   end

   current_user.update(current_cart: nil)

   redirect_to cart_path(@cart)
 end
end
