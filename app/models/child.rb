class Child < ActiveRecord::Base
  extend Enumerize

  attr_accessor :birth_year, :birth_month, :relative_numbers_string

  attr_accessible :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month, :number, :relative_numbers, :relative_numbers_string

  validates_presence_of :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month, :number

  enumerize :sex, in: [:male, :female]
  enumerize :living_arrangement, in: [:adoption, :foster_home, :custody]

  normalize_attribute :number, with: :strip
  normalize_attribute :relative_numbers_string, with: :strip_array

  serialize :relative_numbers, Array

  before_save :set_born_on
  before_save :set_relative_numbers

  def sisters
    relatives.where(sex: :female)
  end

  def brothers
    relatives.where(sex: :male)
  end

  def relatives
    self.class.where number: relative_numbers
  end

  private

  def set_born_on
    self.born_on = Date.new.change(year: birth_year.to_i, month: birth_month.to_i)
  end

  def set_relative_numbers
    self.relative_numbers = self.relative_numbers_string
  end
end
