class SocialProviderPolicy < Struct.new(:user, :social_provider)
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.where(:user_id => user.id)
    end
  end

  def manage?
    social_provider.user == user
  end

  def index?
    user.present?
  end
end
