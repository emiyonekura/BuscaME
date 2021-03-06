class ProductsController < ApplicationController
  before_action :set_business, except: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /products
  # GET /products.json
  def index
    @products = Product.highlighted if params[:q].blank?
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q].present?    
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = @product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
        @product = Product.new(product_params)
        @product.business_id = @business.id 
     #   @product.business_id = current_user.business_id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_business
      @business = Business.find(params[:business_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :business_id, :business.user_id, :category_id, :q, :photo, :photo_cache)
    end
end
