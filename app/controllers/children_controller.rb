class ChildrenController < MainController
  def index
    @children = Child.all

    super
  end

  alias_method :template, :action_name
end
