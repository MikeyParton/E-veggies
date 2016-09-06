class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :load_order, only: [:index, :create, :update]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @order = Order.find(session[:order_id])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @products = Product.all
    @product = Product.create(product_params)
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
  end

  def delete
    @product = Product.find(params[:id])
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @order = Order.find(session[:order_id])
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :price, :description, :image_url, :stock)
    end
end
