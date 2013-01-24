class Child < ActiveRecord::Base
  extend Enumerize

  attr_accessor :birth_year, :birth_month, :relative_numbers_string

  attr_accessible :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month, :number, :relative_numbers, :relative_numbers_string,
    :published_on, :photo

  validates_presence_of :sex, :name, :hair_color, :eyes_color, :living_arrangement,
    :birth_year, :birth_month, :number, :published_on, :photo

  has_attached_file :photo, :storage => :elvfs, :elvfs_url => Settings['storage.url']

  enumerize :eyes_color,          in: [:grey, :blue, :green, :black, :brown]
  enumerize :hair_color,          in: [:black, :dark, :light, :red, :brown, :light_brown, :dark_brown]
  enumerize :living_arrangement,  in: [:adoption, :foster_home, :custody], :multiple => true
  enumerize :sex,                 in: [:male, :female]

  normalize_attribute :number, with: :strip
  normalize_attribute :relative_numbers_string, with: :strip_array
  normalize_attribute :living_arrangement, with: :blank_array

  searchable do
    string :number
    date :published_on
    time :created_at
  end

  serialize :relative_numbers, Array
  serialize :living_arrangement, Array

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
