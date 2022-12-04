class Admins::LandPercelsController < ApplicationController

  def show
    @land_percel = LandPercel.find(params[:id])
    @property = @land_percel.property
    @plan_orders = @land_percel.plan_orders
  end

  def registration
    @property = Property.find(params[:id])
    @images = @property.images
    @land_percel = Form::LandPercelCollection.new
  end

  def new_create
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
        flash.now[:danger] = 'エラーが発生し、土地情報を正しく登録できませんでした。'
        render :registration
      end
    else
      @property = Property.new(form_property_params)
      flash.now[:danger] = '物件登録にエラーが発生し、登録できませんでした。'
      render template: "properties/new"
    end
  end

  def create
    @land_percel = LandPercel.new(land_percel_params)
    if @land_percel.valid?
      @area_tsubo = @land_percel.area.to_f * 0.3025
      @land_percel.price_tsubo = (@land_percel.price.to_f / @area_tsubo.to_f).round(0)
      if @land_percel.save
        flash[:notice] = '土地情報を新規登録しました。'
        redirect_to admins_property_path(@land_percel.property_id)
      end
    else
      @property = Property.find(@land_percel.property_id)
      @land_percels = @property.land_percels
      flash.now[:danger] = 'エラーが発生し、土地情報を正しく登録できませんでした。'
      render template: "admins/properties/show"
    end
  end

  def edit
    @land_percel = LandPercel.find(params[:id])
  end

  def update
    @land_percel = LandPercel.find(params[:id])
    if @land_percel.update(land_percel_params)
      flash[:success] = '変更を保存しました。'
      redirect_to admins_land_percel_path(@land_percel.id)
    else
      flash.now[:warning] = '必須項目に誤りがあります。必要情報を正しく入力してください。'
      render :edit
    end
  end

  def destroy
    @land_percel = LandPercel.find(params[:id])
    @land_percel.destroy
    flash[:success] = "土地区画#{@land_percel.name}を削除しました。"
    redirect_to admins_property_path(@land_percel.property_id)
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
          :reference_plan_id,
          :comment])
  end


  def land_percel_params
        params.require(:land_percel).permit(
          :property_id,
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
          :reference_plan_id,
          :remove_reference_plan_id,
          :comment)
  end

end
