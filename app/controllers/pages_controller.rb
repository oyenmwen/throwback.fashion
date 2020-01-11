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
  @title = params[:product][:title]
  @price = params[:product][:price]
  @size = params[:size]
  @found = false
  puts cookies[:cart]
  if !cookies[:cart]
    cookies[:cart] = []
    cookies[:cart].push({:title => @title, :price => @price, :size => @size, :qty=>1})
  else
    cookies[:cart].each do |p|
      if p.has_value?(@title) && p.has_value?(@size)
        p[:qty] +=1
        @found = true
      end
  end
  unless @found
    cookies[:cart].push({:title => @title, :price => @price, :size => @size, :qty=>1})
  end
  # @product = params.require(:product).permit(:title, :description, :price)
  end
end

# def purchase
# end

def cart
  # @cart = cookies[:cart]
end


end
