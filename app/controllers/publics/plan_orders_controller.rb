class Publics::PlanOrdersController < ApplicationController

  def show
    @plan_order = PlanOrder.find(params[:id])
    @land_percel = @plan_order.land_percel
    @property = @land_percel.property
    @plan_orders = @land_percel.plan_orders
    @customer = @plan_order.customer
  end

  def registration
    @customer = Customer.find(current_customer.id)
    @land_percel = LandPercel.find(params[:id])
    @property = @land_percel.property
    @plan_orders = @land_percel.plan_orders
    @plan_order = PlanOrder.new
    @check = current_customer.plan_orders.where(land_percel_id: params[:id])
    if @check.count >= 1
      flash[:danger] = '１つの土地に対してプラン依頼は１度までです。'
      redirect_to plan_order_path(@check.first.id)
    end
  end

  def create
    @plan_order = PlanOrder.new(plan_order_params)
    @plan_order.customer_id = current_customer.id
    @check = current_customer.plan_orders.where(land_percel_id: params[:id])
    if @check.count >= 1
      flash[:danger] = '１つの土地に対してプラン依頼は１度までです。'
      redirect_to plan_order_path(@check.first.id)
    elsif @plan_order.save
      flash[:success] = "プラン作成依頼を受け付けました。"
      redirect_to plan_order_path(@plan_order.id)
    else
      flash.now[:danger] = 'エラーが発生し、依頼を受付できませんでした。'
      render registration
    end
  end

  private

  def plan_order_params
    params.require(:plan_order).permit(
      :land_percel_id,
      :remarks,
      :contact_datetime_1,
      :contact_datetime_2,
      :contact_datetime_3,
      :tenant_number_order,
      :tenant_member_order,
      :house_type_order,
      :total_budget_order,
      :number_floor_order,
      :floor_area_order,
      :number_room_order,
      :ldk_floor_number_order,
      :ldk_area_order,
      :kitchen_type_order,
      :mbr_area_order,
      :br_area_order,
      :bathroom_area_order,
      :japanese_room_order,
      :storage_order,
      :den_order,
      :den_type_order,
      :wic_order,
      :family_closet_order,
      :sic_order,
      :pantry_order,
      :loft_order,
      :void_order,
      :laundry_room_order,
      :garden_order,
      :parking_number_order,
      :car_model_order,
      :bicycle_parking_number_order,
      :request_details_order)
  end

end
