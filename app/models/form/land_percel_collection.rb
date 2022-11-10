class Form::LandPercelCollection < Form::Base
  FORM_COUNT = 5 #ここで、作成したい登録フォームの数を指定
  attr_accessor :land_percels

  def initialize(attributes = {})
    super attributes
    self.land_percels = FORM_COUNT.times.map { LandPercel.new() } unless self.land_percels.present?
  end

  def land_percels_attributes=(attributes)
    self.land_percels = attributes.map { |_, v| LandPercel.new(v) }
  end

  def save
    LandPercel.transaction do
      self.land_percels.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end