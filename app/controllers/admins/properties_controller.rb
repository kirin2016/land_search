class Admins::PropertiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @search_params = property_search_params
    @properties = Property.search(@search_params).includes(:land_percels)
  end

  def search
  end

  def show
    @property = Property.find(params[:id])
    @land_percels = @property.land_percels
    @land_percel = LandPercel.new
  end

  def new
    @property = Property.new
    @property.images.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      if params[:images].present?
        params[:images][:image].each do |i|
          @property.images.create!(image: i, property_id: @property.id)
        end
        flash[:success] = "物件情報を新規登録しました。"
        redirect_to admins_land_percels_registration_path(@property.id)
      end
    else
      flash.now[:danger] = 'エラーが発生し、登録できませんでした。'
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
    @image = Image.new
    @images = @property.images
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:success] = '変更を保存しました。'
      redirect_to admins_property_path(@property.id)
    else
      flash.now[:warning] = '必須項目に誤りがあります。必要情報を正しく入力してください。'
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    if @property.destroy(property_params)
      flash[:success] = '変更を保存しました。'
      redirect_to admins_properties_path
    else
      flash.now[:warning] = 'エラーが発生し、削除できませんでした。'
      render :show
    end
  end


  private

  def property_params
    params.require(:property).permit(
      :id,
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
      images_attributes: [:id, :image_cache, :explanation, image: []])
  end

  def property_search_params
    params.fetch(:search, {}).permit(
      :prefecture_code,
      :address_city,
      :address_town,
      :nearest_railroad,
      :nearest_station,
      :transportation,
      :walking_time_to,
      :bus_time_to,
      :bus_stop_walking_time_to,
      :car_time_to,
      :land_use,
      :area_from,
      :area_to)
  end

end
