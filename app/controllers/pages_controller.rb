class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

def home
  @products = Product.all
end

# def products
# end

def contact
end

def buy
  @first_name = params[:first_name]
  @last_name = params[:last_name]
  @email = params[:email]
  @address = params[:address]
  @address_two = params[:address2]
  @country = params[:country]
  @state = params[:state]
  @zip = params[:zip]



end

# def purchase
# end

def cart
  # @cart = cookies[:cart]
end


end
