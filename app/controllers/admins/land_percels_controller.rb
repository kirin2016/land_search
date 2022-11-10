class Admins::LandPercelsController < ApplicationController
  def show
  end

  def registration
    @property = Property.new(property_params)
    @land_percel = Form::LandPercelCollection.new
  end

  def create
    @property = Property.new(property_params)
    @land_percel = Form::LandPercelCollection.new(land_percel_collection_params)
    if @property.save
      @land_percel.property_id = @property.id
      @area_tsubo = @land_percel.area.to_f / 0.3025
      @land_percel.price_tsubo = (@land_percel.price.to_f / @area_tsubo.to_f).round(0)
      if @land_percel.save
        @property.images.save
        flash[:notice] = '物件情報、土地情報を新規登録しました。'
        redirect_to admins_properties_path
      else
        @property = Property.new(property_params)
        flash.now[:danger] = '土地登録にエラーが発生し、登録できませんでした。'
        render :registration
      end
    else
      @order = Order.new(order_params)
      flash.now[:danger] = '物件登録にエラーが発生し、登録できませんでした。'
      render template: "properties/new"
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
    params.require(:property).permit(
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

  def land_percel_collection_params
        params.require(:form_land_percel_collection).permit(land_percels_attributes: [
          :name,
          :price,
          :area,
          :price_tsubo,
          :shape,
          :connecting_road_situation,
          :main_road_width,
          :main_road_direction,
          :frontage,
          :difference_elevation,
          :private_road_burden,
          :sale_status,
          :reference_plan,
          :comment])
  end

end
