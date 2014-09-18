# encoding: utf-8

class Child < ActiveRecord::Base
  extend Enumerize

  attr_accessor :birth_year, :birth_month, :relative_numbers_string

  attr_accessible :sex, :name, :hair_color, :eyes_color, :living_arrangement, :birth_year,
    :birth_month, :number, :relative_numbers, :relative_numbers_string, :photo

  validates_uniqueness_of :number

  validates_presence_of :sex, :name, :living_arrangement, :number, :photo

  validates_presence_of :birth_year, :birth_month, :unless => :born_on?

  has_attached_file :photo,
                    :storage => :elvfs,
                    :elvfs_url => Settings['storage.url'],
                    :restricted_characters => /^.*(?=\.\w+$)/  # look ahead file extension

  validate :check_image_dimension

  enumerize :eyes_color,          in: [:grey, :blue, :green, :black, :brown]
  enumerize :hair_color,          in: [:black, :dark, :light, :red, :brown, :light_brown, :dark_brown]
  enumerize :living_arrangement,  in: [:adoption, :custody], :multiple => true
  enumerize :sex,                 in: [:male, :female]

  normalize_attribute :number, with: :strip
  normalize_attribute :relative_numbers_string, with: :strip_array
  normalize_attribute :living_arrangement, with: :blank_array

  searchable do
    integer :age
    integer(:number_i) { number.to_i }
    integer(:relative_count) { relatives.count }

    string :number
    string :sex
    string(:living_arrangements, :multiple => true) { living_arrangement.map(&:value) }
  end

  serialize :relative_numbers, Array
  serialize :living_arrangement, Array

  before_save :set_born_on
  before_save :set_relative_numbers

  after_save :set_relations

  def sisters
    relatives.where(sex: :female)
  end

  def brothers
    relatives.where(sex: :male)
  end

  def relatives
    self.class.where number: relative_numbers
  end

  def months_from_birth
    now = -> { Time.zone.now.to_date }.call
    (now.year * 12 + now.month) - (born_on.year * 12 + born_on.month)
  end

  def age
    months_from_birth / 12
  end

  def adult?
    age > 18
  end

  def self.relative_counts_options
    [['не важно', 0], ['есть', 1], ['нет', 2]]
  end

  def absent_relative_numbers
    relative_numbers - relatives.pluck(:number)
  end

  def self.solr_search_results(params, options)
    page                = params[:page] || 1
    number              = params[:search].try(:[], :number)
    age_min             = params[:search].try(:[], :age_min)
    age_max             = params[:search].try(:[], :age_max)
    sex                 = params[:search].try(:[], :sex)
    relative_count      = params[:search].try(:[], :relative_count).try(:to_i)
    living_arrangements = params[:search].try(:[], :living_arrangements)
    only_young          = options[:only_young]
    only_adult          = options[:only_adult]
    per_page            = 20

    search {
      with(:number, number)                                 if number.present?
      with(:age).between(age_min..age_max)                  if age_min.present? && age_max.present?
      with(:age).less_than(19)                              if only_young
      with(:age).greater_than(18)                           if only_adult
      with(:sex, sex)                                       if sex.present?

      unless relative_count.nil? || relative_count.zero?
        if relative_count == 1
          with(:relative_count).greater_than(0)
        elsif relative_count == 2
          with(:relative_count, 0)
        end
      end

      any_of do
        living_arrangements.delete_if{ |key, value| value.blank? }.each do |living_arrangement|
          with(:living_arrangements, living_arrangement)
        end
      end if living_arrangements.present?

      order_by(:number_i, :desc)

      paginate(:page => page, :per_page => per_page)
    }.results
  end

  private

  def check_image_dimension
    return unless photo.queued_for_write[:original]
    dimensions = Paperclip::Geometry.from_file(photo.queued_for_write[:original].path)
    width = dimensions.width
    height = dimensions.height
    if (width.to_i < 150 || height.to_i < 200)
      self.errors.add(:photo, "Изображение должно быть не меньше 150x200 пикселей")
    end
  end

  def set_born_on
    self.born_on = Date.new.change(year: birth_year.to_i, month: birth_month.to_i) if birth_year && birth_month
  end

  def set_relative_numbers
    self.relative_numbers = self.relative_numbers_string
  end

  def set_new_relations
    relatives.each do |relative|
      relative.relative_numbers += [self.number]
      relative.relative_numbers.uniq!
      relative.save
    end
  end

  def unset_rotten_relations
    rotten_numbers = self.relative_numbers_was - self.relative_numbers

    self.class.where(number: rotten_numbers).each do |relative|
      relative.relative_numbers -= [self.number] and relative.save
    end
  end

  def set_relations
    self.class.skip_callback :save, :before, :set_relative_numbers
    self.class.skip_callback :save, :after, :set_relations
    unset_rotten_relations
    set_new_relations
    self.class.set_callback :save, :after, :set_relations
    self.class.set_callback :save, :before, :set_relative_numbers
  end
end

# == Schema Information
#
# Table name: children
#
#  id                 :integer          not null, primary key
#  number             :string(255)
#  name               :string(255)
#  hair_color         :string(255)
#  eyes_color         :string(255)
#  living_arrangement :string(255)
#  sex                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  born_on            :date
#  relative_numbers   :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_url          :text
#

