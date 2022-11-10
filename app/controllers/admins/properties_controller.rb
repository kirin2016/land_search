class Admins::PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def search
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "#{@property.name}を新規登録しました。"
      redirect_to admin_item_path(@item.id)
    else
      flash.now[:danger] = 'エラーが発生し、登録できませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def property_params
    params.require(:property).permit(:id,
      :name,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_town,
      :address_street,
      :nearest_railroad,
      :nearest_station,
      :transportation,
      :nearest_bus_stop,
      :walking_time,
      :bus_time,
      :bus_stop_walking_time,
      :car_time,
      :building_coverage_ratio,
      :floor_area_ratio,
      :land_use,
      :real_estate_name,
      :real_estate_staff,
      :real_estate_telephone,
      :introduction,
      images_images: [])
  end


end
