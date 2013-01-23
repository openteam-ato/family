AttributeNormalizer.configure do |config|
  config.normalizers[:strip_array] = ->(value, options) do
    value.split(',').map(&:strip)
  end

  config.normalizers[:blank_array] = ->(value, options) do
    (value || []).delete_if(&:blank?)
  end
end

