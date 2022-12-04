class Admins::ImagesController < ApplicationController
  def create
    @property = Property.find(image_params[:property_id])
    @image = Image.new(image_params)
    @images = @property.images
    if @image.save
      flash[:success] = "物件資料を新規登録しました。"
      redirect_to edit_admins_property_path(@property.id)
    else
      flash.now[:danger] = 'エラーが発生し、登録できませんでした。'
      render template: "admins/properties/edit"
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:success] = "物件資料を削除しました。"
    redirect_to edit_admins_property_path(@image.property_id)
  end

  private

  def image_params
    params.require(:image).permit(
      :property_id,
      :image,
      :explanation)
  end

end
