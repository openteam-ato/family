AttributeNormalizer.configure do |config|
  config.normalizers[:strip_array] = ->(value, options) do
    value.split(',').map(&:strip)
  end
end

