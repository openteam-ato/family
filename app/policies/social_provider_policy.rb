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

  def to_pending?
    manage? && social_provider.draft?
  end

  def edit?
    manage? && (social_provider.draft? || social_provider.published?)
  end

  def destroy?
    manage? && social_provider.draft?
  end
end
