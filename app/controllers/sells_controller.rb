class SellsController < ApplicationController
  before_action :set_sell, only: [:show, :edit, :update, :destroy]

  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
  end

  # GET /sells/new
  def new
    @sell = Sell.new
  end

  # GET /sells/1/edit
  def edit
    @editing = true
  end

  # POST /sells
  # POST /sells.json
  def create
    @sell = Sell.new(sell_params)

    order = Order.where(table: @sell.table, pay:false).last
    order.pay = true
    order.save

    subtotal = 0
    order.order_items.each do |item|
      subtotal = subtotal + item.product.price * item.quantity
    end
    @sell.order = order
    @sell.subtotal = subtotal
    @sell.total = subtotal + subtotal * 0.16

    respond_to do |format|
      if @sell.save

        format.html { redirect_to @sell, notice: 'Sell was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sell }
      else
        format.html { render action: 'new' }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'Sell was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_params
      params.require(:sell).permit(:table)
    end
end
