class Publics::PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @land_percels = @property.land_percels
  end

  def search
  end
end
