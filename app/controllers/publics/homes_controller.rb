class Publics::HomesController < ApplicationController
  def top
    @properties = Property.order(created_at: :desc).limit(6)
  end
end
