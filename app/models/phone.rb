class Phone < Contact
  extend Enumerize

  enumerize :kind, :in => [:personal, :work, :fax]

  validates_presence_of :kind, :value
end
