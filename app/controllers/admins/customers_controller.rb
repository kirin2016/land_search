class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

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
      flash[:success] = 'お客様情報を変更しました。'
      redirect_to admins_customer_path(@customer.id)
    else
      flash.now[:danger] = 'エラーが発生し、変更できませんでした。'
      render :edit
    end
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
      :sale_staff,
      :sale_staff_telephone)
  end


end
