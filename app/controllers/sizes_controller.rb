class SizesController < ApplicationController
  before_action :set_size, only: [:show, :edit, :update, :destroy]

  # GET /sizes
  # GET /sizes.json
  def index
    if current_admin
      @sizes = Size.all
      render 'index.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /sizes/1
  # GET /sizes/1.json
  def show
    if current_admin
      render 'show.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /sizes/new
  def new
    if current_admin
      @size = Size.new
      render 'new.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /sizes/1/edit
  def edit
    if current_admin
      render 'edit.html.erb'
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # POST /sizes
  # POST /sizes.json
  def create
    if current_admin
      @size = Size.new(size_params)

      respond_to do |format|
        if @size.save
          format.html { redirect_to @size, notice: 'Size was successfully created.' }
          format.json { render :show, status: :created, location: @size }
        else
          format.html { render :new }
          format.json { render json: @size.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end

  end

  # PATCH/PUT /sizes/1
  # PATCH/PUT /sizes/1.json
  def update
    if current_admin
      respond_to do |format|
        if @size.update(size_params)
          format.html { redirect_to @size, notice: 'Size was successfully updated.' }
          format.json { render :show, status: :ok, location: @size }
        else
          format.html { render :edit }
          format.json { render json: @size.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end

  end

  # DELETE /sizes/1
  # DELETE /sizes/1.json
  def destroy
    if current_admin
      @size.destroy
      respond_to do |format|
        format.html { redirect_to sizes_url, notice: 'Size was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:warning] = "You must be logged in to see this page"
      raise ActionController::RoutingError.new('Not Found')
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_size
      if current_admin
        @size = Size.find(params[:id])
      else
        flash[:warning] = "You must be logged in to see this page"
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:size)
    end
end
