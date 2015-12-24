class CarsController < ApplicationController
  def index
    @deals = Car.where(hidden: false).select do |car|
      car.ed_price - car.cl_price > 1000 && car.cl_price > 100
    end
  end

  def hide
    car = Car.find_by(id: params[:id])
    car.hidden = true
    car.save
    redirect_to "/cars"
  end
end