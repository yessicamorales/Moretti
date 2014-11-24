class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
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
    @editing = true
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.create(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to edit_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def new_item
    @order = Order.find(params[:id])
    @products = Product.where.not(id: @order.product_ids)
  end

  def add_item
    item = OrderItem.new(item_params)
    if item.save
      item.order.save
      @order = item.order.save

      respond_to do |format|
        format.html { redirect_to edit_order_path(order: @order), notice: 'Item agregado.' }
        format.json { head :no_content }
      end
    end
  end

  def delete_item
    @item = OrderItem.find(params[:item])
    @order = @item.order
    @item.destroy
    respond_to do |format|
      format.html { redirect_to edit_order_path(@order) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:table)
    end

    def item_params
      params.permit(:order_id, :product_id, :quantity)
    end
end
