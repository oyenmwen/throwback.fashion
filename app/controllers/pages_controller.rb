class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'securerandom'


def home
  @products = Product.all
end

# def products
# end

def contact
end

def buy

  @user = User.new
  @user.first_name = params[:user][:first_name]
  @user.last_name = params[:user][:last_name]
  @user.email = params[:user][:email]
  @user.address = params[:user][:address]
  @user.address_two = params[:user][:address2]
  @user.country = params[:user][:country]
  @user.state = params[:user][:state]
  @user.zip = params[:user][:zip]
  @user.save
  @order = Order.new
  @ord_id= SecureRandom.hex(8)
  while Order.find_by(ord_id: @ord_id) != nil
    @ord_id= SecureRandom.hex(8)
  end
  @items = params[:items]

  @items.each do |k,e|
    @order.user = @user
    @order.product = Product.find_by(title: e[:title])
    @order.size = Size.find_by(size: e[:size])
    @order.qty = e[:qty]
    @order.ord_id = @ord_id
    @order.save

end

end

# def purchase
# end

def cart
  # @cart = cookies[:cart]
end


end
