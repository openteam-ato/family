AttributeNormalizer.configure do |config|
  config.normalizers[:strip_array] = ->(value, options) do
    value.split(',').map(&:strip)
  end

  config.normalizers[:blank_array] = ->(value, options) do
    value.try(:detect, &:present?) ? value : nil
  end
end

