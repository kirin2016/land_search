class Admins::PlanOrdersController < ApplicationController
  def index
    @plan_orders = PlanOrder.all
  end

  def show
  end

  def update
  end
end
