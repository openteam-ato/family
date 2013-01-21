class Child < ActiveRecord::Base
  extend Enumerize

  attr_accessor :birth_year, :birth_month

  attr_accessible :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month

  validates_presence_of :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month

  enumerize :sex, in: [:male, :female]
  enumerize :living_arrangement, in: [:adoption, :foster_home, :custody]

  before_save :set_born_on

  private

  def set_born_on
    self.born_on = Date.new.change(year: birth_year.to_i, month: birth_month.to_i)
  end
end
