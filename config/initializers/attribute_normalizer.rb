AttributeNormalizer.configure do |config|
  config.normalizers[:strip_array] = ->(value, options) do
    value.squish.split(/\s/).uniq
  end

  config.normalizers[:blank_array] = ->(value, options) do
    value.try(:detect, &:present?) ? value : nil
  end
end

