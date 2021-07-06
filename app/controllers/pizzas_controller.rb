class PizzasController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index]
  before_action :load_cart

  def index
    @pizzas = Pizza.all
  end

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def delivery
    
  end

  private
  # Initializa the visin on first visit
  def initialize_session
    session[:visit_count] ||= 0 
    session[:cart] ||= []
  end

  def load_cart
    @cart = Pizza.find(session[:cart])
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
