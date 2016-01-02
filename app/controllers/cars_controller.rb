class CarsController < ApplicationController
  def index
    @deals = Car.order('updated_at desc').limit(500).where(hidden: false).select do |car|
      car.ed_price - car.cl_price > 1000 && car.cl_price > 100
    end.first(40)
  end

  def hide
    car = Car.find_by(id: params[:id])
    car.hidden = true
    car.save
    redirect_to "/cars"
  end
end