class Email < Contact
  validates_presence_of :value

  delegate :to_s, :to => :value
end
