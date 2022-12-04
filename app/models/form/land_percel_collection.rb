class Form::LandPercelCollection < Form::Base
  FORM_COUNT = 3 #ここで、作成したい登録フォームの数を指定
  attr_accessor :land_percels

  def initialize(attributes = {})
    super attributes
    self.land_percels = FORM_COUNT.times.map { LandPercel.new() } unless self.land_percels.present?
  end

  def land_percels_attributes=(attributes)
    self.land_percels = attributes.map { |_, v| LandPercel.new(v) }
  end

  def save(property)
    LandPercel.transaction do
      self.land_percels.map do |land_percel|
        #if product.availability
          land_percel.property_id = property.id
          area_tsubo = land_percel.area.to_f * 0.3025
          land_percel.price_tsubo = (land_percel.price.to_f / area_tsubo.to_f).round(0)
          land_percel.save
        #end
      end
    end
      return true
    rescue => e
      return false
  end
end