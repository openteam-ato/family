class Child < ActiveRecord::Base
  extend Enumerize

  attr_accessible :sex, :name, :hair_color, :eyes_color, :living_arrangement

  validates_presence_of :sex, :name, :hair_color, :eyes_color, :living_arrangement

  enumerize :sex, in: [:male, :female]
  enumerize :living_arrangement, in: [:adoption, :foster_home, :custody]
end
