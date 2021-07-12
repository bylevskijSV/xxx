class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]
  def edit
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Заказ успешно cформирован"
      set_confirmed_by
      session[:order_id] = nil
      redirect_to root_path
    else
      render 'edit'
    end
  end
  private

  def order_params
    params.require(:order).permit(:name, :phone, :street, :house_number, :subway_number, :apartment_number, :note)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_confirmed_by
    @order.confirmed_by = true
    @order.save
  end
end
