class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    if current_admin
      @orders = Order.all
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if current_admin
      render 'show.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /orders/new
  def new
    if current_admin
      @order = Order.new
      render 'new.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /orders/1/edit
  def edit
    if current_admin
      render 'edit.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    if current_admin
      @order = Order.new(order_params)

      respond_to do |format|
        if @order.save
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end


  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if current_admin
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end


  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    if current_admin
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      if current_admin
        @order = Order.find(params[:id])
      else
        flash[:warning] = "You must be logged in to see this page"
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_id, :qty, :tracking_no, :product_id, :user_id, :size_id)
    end
end
