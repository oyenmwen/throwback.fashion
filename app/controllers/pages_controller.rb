class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'securerandom'
  require 'sendgrid-ruby'
  include SendGrid

def home
  @products = Product.all
end

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
  @order_id= SecureRandom.hex(8)
  while Order.find_by(order_id: @order_id) != nil
    @order_id= SecureRandom.hex(8)
  end
  @items = @@items
  @mail_html="<html><body>
  <img src='https://i.imgur.com/LwHttnp.png' width='250' height='100'>
  <h1>Thank you for your order #{@@first_name}!</h1>
  <h3>Your order details:</h3>
  <h4>Order number <strong>#{@order_id}</strong></h4>
  <p>#{@@first_name} #{@@last_name}</p>
  <p>#{@@address} #{@@address_two}</p>
  <p>#{@@zip} #{@@state} #{@@country} </p><hr>
  "
  @items.each do |k,e|
    @order = Order.new
    @order.user = @user
    @order.product = Product.find_by(title: e[:title])
    @order.size = Size.find_by(size: e[:size])
    @order.qty = e[:qty]
    @order.order_id = @order_id
    @order.save
    @mail_html+="<p><img src = '#{e[:img]}'width='120' height='140'> #{e[:title]}, Size: #{e[:size]}, Quantity: #{e[:qty]}</p><hr>"
  end

@mail_html +="
<h4>Expect a tracking number in 1-3 days</h4>
<h4><strong>If you have any further questions please email us at contact@throwback.vintage! :)</strong></h4></body></html>"
  from = Email.new(email: 'noreply@throwback.fashion')
  to = Email.new(email: @@email)
  subject = "Thank You!! Order #{@order_id}"
  content = Content.new(type: 'text/html', value: @mail_html)
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
      images: ["#{e[:img]}"],
      amount: 2999,
      currency: 'usd',
      quantity: e[:qty],
      })
    end
    Stripe.api_key = ENV['STRIPE_SK_KEY']
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @line,
      success_url: root_url + "order/success",
      cancel_url: root_url + "checkout",
    )
    @STRIPE_PK_API = ENV['STRIPE_PK_KEY']
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
