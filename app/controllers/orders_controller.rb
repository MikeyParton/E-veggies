class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]
  #before_action :check_stock, only: [:update]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user_id: session[:user_id]).where(status: "submitted").all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params.merge(status: 'submitted'))
      session[:order_id] = nil
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart was successfully emptied.' }
      format.json { head :no_content }
    end
  end

  def confirm
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def check_stock
      check_results = @order.order_items.collect do |item| 
        if (item.product.stock < item.quantity)
          flash.now[:danger] = "Sorry, it looks like we're out of some of those things"
          false
        else
          true
        end
      end

       if check_results.include?(false)
          render "show"
          return false
       else 
          @order.order_items.each do |item|
              item.remove_stock          
          end
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {}).permit(:user_id, :status, :address_id)
    end
end