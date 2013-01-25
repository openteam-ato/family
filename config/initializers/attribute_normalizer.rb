AttributeNormalizer.configure do |config|
  config.normalizers[:strip_array] = ->(value, options) do
    value.split(/\s/).map(&:strip).uniq
  end

  config.normalizers[:blank_array] = ->(value, options) do
    value.try(:detect, &:present?) ? value : nil
  end
end

