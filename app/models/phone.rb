class Phone < Contact
  extend Enumerize

  enumerize :kind, :in => [:personal, :work, :fax]

  validates_presence_of :kind, :value

  delegate :to_s, :to => :human_value

  def human_value
    "#{kind_text}: #{value}"
  end
end
