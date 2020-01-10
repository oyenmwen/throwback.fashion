class PagesController < ApplicationController

def home
  @products = Product.all
end

# def products
# end

def contact
end

def cart
end

end
