class ChildrenController < MainController
  def index
    @children = Child.all

    super
  end

  def show
    @child = Child.find(params[:id])

    super
  end

  alias_method :template, :action_name
end
