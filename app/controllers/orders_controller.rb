class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :show]
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
    redirect_to root_path unless current_user || @order.guest_code == session[:guest_code]
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.guest_code = guest_code

    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:plates, :spice_level, :extra_sauce, :note, :email)
    end
end
