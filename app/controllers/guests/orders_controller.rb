class Guests::OrdersController < ApplicationController

  def index
    @orders = Order.where(guest_code: guest_code)
  end

  def show
  end
end