class Publics::LandPercelsController < ApplicationController
  def show
    @land_percel = LandPercel.find(params[:id])
    @property = @land_percel.property
    @plan_orders = @land_percel.plan_orders
    @plan_order = @plan_orders.where(customer_id: current_customer.id)
  end
end
