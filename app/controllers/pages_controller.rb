class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'securerandom'
  require 'sendgrid-ruby'
  include SendGrid


def home
  @products = Product.all
end

# def products
# end

def contact
end

def order_success

  @user = User.new
  @user.first_name = @@first_name
  @user.last_name = @@last_name
  @user.email = @@email
  @user.address = @@address
  @user.address_two = @@address_two
  @user.country = @@country
  @user.state = @@state
  @user.zip = @@zip
  @user.save
  @order = Order.new
  @ord_id= SecureRandom.hex(8)
  while Order.find_by(ord_id: @ord_id) != nil
    @ord_id= SecureRandom.hex(8)
  end
  @items = @@items

  @items.each do |k,e|
    @order.user = @user
    @order.product = Product.find_by(title: e[:title])
    @order.size = Size.find_by(size: e[:size])
    @order.qty = e[:qty]
    @order.ord_id = @ord_id
    @order.save
  end
  from = Email.new(email: 'test@example.com')
  to = Email.new(email: @user.email)
  subject = 'Sending with SendGrid is Fun'
  content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers


end

# def purchase
# end

def cart

end

def purchase

  @line = []
  @@items.each do |k,e|
    @line.push({
      name: e[:title],
      description: e[:size],
      amount: 2999,
      currency: 'usd',
      quantity: e[:qty],
      })
    # @order.product = Product.find_by(title: e[:title])
    # @order.size = Size.find_by(size: e[:size])
    # @order.qty = e[:qty]
    # @order.ord_id = @ord_id
    # @order.save
    end
    Stripe.api_key = 'sk_test_6NR3y3WIvKHHf0gcN3mgBIso00UJuvS671'
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @line,
      success_url: root_url+"order/success",
      cancel_url: "https://youtube.com",
    )
    @CHECKOUT_SESSION_ID = session.id


end

def save
  @@first_name = params[:user][:first_name]
  @@last_name = params[:user][:last_name]
  @@email = params[:user][:email]
  @@address = params[:user][:address]
  @@address_two = params[:user][:address2]
  @@country = params[:user][:country]
  @@state = params[:user][:state]
  @@zip = params[:user][:zip]
  @@items = params[:items]
  respond_to do |format|
    format.html
  end
end

def checkout

end

end
