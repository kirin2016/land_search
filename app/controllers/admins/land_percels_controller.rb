class Admins::LandPercelsController < ApplicationController
  def show
  end

  def registration
    @property = Property.new(form_property_params)
    byebug
    @property.images = params[:images]
    @land_percel = Form::LandPercelCollection.new
    if @property.invalid?
      flash.now[:warning] = '必要項目をすべて入力してください。'
      render template: "admins/properties/new"
    end
  end

  def create
    @property = Property.new(form_property_params)
    @land_percel = Form::LandPercelCollection.new(land_percel_collection_params)
    if @property.save

      @land_percel.land_percels.each do |land_percel|
        land_percel.property_id = @property.id
        @area_tsubo = land_percel.area.to_f * 0.3025
        land_percel.price_tsubo = (land_percel.price.to_f / @area_tsubo.to_f).round(0)
        # land_percel.save
      end
      if @land_percel.save
      flash[:notice] = '物件情報、土地情報を新規登録しました。'
      redirect_to admins_properties_path
      else

        @property = Property.new(form_property_params)
        flash.now[:danger] = '土地登録にエラーが発生し、登録できませんでした。'
        render :registration
      end
    else
      @property = Property.new(form_property_params)
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


  def form_property_params
    params.require(:form_land_percel_collection).require(:property).permit(
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
      images_attributes: [:image, :image_cache, :explanation])
  end

  def images_params
    params.require(:images).permit(
      :explanation,
      image: [],
      images_cache: [])
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
