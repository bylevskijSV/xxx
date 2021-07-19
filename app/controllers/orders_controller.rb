class OrdersController < ApplicationController
  include OrdersHelper

  before_action :set_order, only: [:edit, :update]

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Заказ успешно cформирован"
      set_confirmed_by
      send_order_to_telegram
      session[:order_id] = nil
      redirect_to root_path
    else
      render :edit, location: edit_order_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :street, :house_number, :subway_number, :apartament_number, :note)
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
