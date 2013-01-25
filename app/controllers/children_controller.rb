class ChildrenController < MainController
  def index
    @children = Child.solr_search_results(params)

    super
  end

  def show
    @child = Child.find_by_number(params[:number])

    super
  end

  alias_method :template, :action_name
end
