class ChildrenController < MainController
  def index
    @children = Child.solr_search_results(params)

    super
  end

  def show
    @child = Child.find(params[:id])

    super
  end

  alias_method :template, :action_name
end
