class Publics::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @plan_orders = @customer.plan_orders
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = 'マイページを変更しました。'
      redirect_to customer_path(@customer.id)
    else
      flash.now[:danger] = 'エラーが発生し、変更できませんでした。'
      render :edit
    end
  end


  def unsubcribe
    @customer = Customer.find(params[:id])
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました、ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
      :telephone_number,
      :email,
      :is_deleted,
      :tenant_number,
      :tenant_member,
      :house_type,
      :total_budget,
      :number_floor,
      :floor_area,
      :number_room,
      :ldk_floor_number,
      :ldk_area,
      :kitchen_type,
      :mbr_area,
      :br_area,
      :bathroom_area,
      :japanese_room,
      :storage,
      :den,
      :den_type,
      :wic,
      :family_closet,
      :sic,
      :pantry,
      :loft,
      :void,
      :laundry_room,
      :garden,
      :parking_number,
      :car_model,
      :bicycle_parking_number,
      :request_details)
  end

end
