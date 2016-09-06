class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :load_order, only: [:create, :update]

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.find_or_initialize_by(product_id: params[:product_id], order_id: @order.id)
    @order_item.quantity += params[:change].to_i

    if @order_item.quantity  == 0
      @order_item.destroy
    else
      @order_item.save
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item.quantity = params[:order_item][:quantity].to_i
    if @order_item.quantity == 0
      @order_item.destroy
    else
      @order_item.update(order_item_params)
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order = @order_item.order
    @order_item.destroy   
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end

end
