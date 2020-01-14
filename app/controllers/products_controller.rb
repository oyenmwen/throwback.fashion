class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if current_admin
      @products = Product.all
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
      @sizes = Size.all
  end

  # GET /products/new
  def new
    if current_admin
      @product = Product.new
      render 'new.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end
  end

  # GET /products/1/edit
  def edit
    if current_admin
      render 'edit.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end
  end

  # POST /products
  # POST /products.json
  def create
    if current_admin
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end

  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if current_admin
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end

  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy

    if current_admin
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      redirect_to '/admin/login'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :product_img)
    end
end
