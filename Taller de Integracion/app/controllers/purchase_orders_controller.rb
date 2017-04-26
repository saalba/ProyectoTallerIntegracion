class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :update, :destroy]

  # GET /purchase_orders
  def index
    @purchase_orders = PurchaseOrder.all
    render json: @purchase_orders
  end

  # GET /purchase_orders/1
  def show
    render json: @purchase_order
  end

  # POST /purchase_orders
  #{"channel": "b2b","supplier": "grupo 1","client": "grupo 2",	"Sku": "atf1233","quantity": 2,"unitPrice": 3000,"Deadline": "17 / 10 / 2017"}

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    if @purchase_order.save
      render json: '{"orderId": "qsda1", "created_at": "2017-04-26T17:03:36.154Z","channel": "b2b","supplier": "grupo 1","client": "grupo 2", "Sku": "atf1233","quantity": 2, "dispatchedQuantity": "0","unitPrice": 3000, "Deadline": "17 / 10 / 2017", "state": "Acepted", "Notes": "In progress","billId": "sck2"}', status: 202, location: @purchase_order
    else
      render json: {error: 'Incomplete order data'}, status: 400
    end
  end

  # PATCH/PUT /purchase_orders/1
  def update
    if @purchase_order.update(purchase_order_params)
      render json: @purchase_order
    else
      render json: @purchase_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_orders/1
  def destroy
    @purchase_order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_order_params
      params.require(:purchase_order).permit(:orderId, :channel, :supplier, :client, :Sku, :quantity, :dispatchedQuantity, :unitPrice, :deadline, :state, :rejectionCause, :CancellationCause, :notes, :billId)
    end
end
