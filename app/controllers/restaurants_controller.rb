class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
  end

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :photo)
  end

end
