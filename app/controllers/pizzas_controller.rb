class PizzasController < ApplicationController
  # before_action :initialize_session
  # before_action :increment_visit_count, only: %i[index]
  # before_action :load_cart
  before_action :set_pizza, only: [:show, :update, :edit, :destroy]

  def show
  end

  def index
    @pizzas = Pizza.all
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      flash[:notice] = "Pizza #{@pizza.name} создана"
      redirect_to pizza_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @pizza.update(pizza_params)
      flash[:notice] = "Pizza #{@pizza.name} успешно обновлена"
      redirect_to pizza_path
    else
      render 'edit'
    end
  end

  def destroy
    @pizza.destroy
    flash[:notice] = "Пицца #{@pizza.name} успешно удалена"
    redirect_to pizza_path
  end

  # def add_to_cart
  #   id = params[:id].to_i
  #   session[:cart] << id unless session[:cart].include?(id)
  #   redirect_to root_path
  # end

  # def remove_from_cart
  #   id = params[:id].to_i
  #   session[:cart].delete(id)
  #   redirect_to root_path
  # end

  # def delivery
  # end

  private
  # Initializa the visin on first visit
  # def initialize_session
  #   session[:visit_count] ||= 0
  #   session[:cart] ||= []
  # end

  # def load_cart
  #   @cart = Pizza.find(session[:cart])
  # end

  # def increment_visit_count
  #   session[:visit_count] += 1
  #   @visit_count = session[:visit_count]
  # end
  def set_pizza
    @pizza = Pizza.find(params[:id])
  end

  def pizza_params
    params.require(:pizza).permit(:name, :price, :ingredients, :description, :weight, :photo, :popularity)
  end
end
