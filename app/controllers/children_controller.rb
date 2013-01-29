class ChildrenController < MainController
  def index
    @children = Child.solr_search_results(params, { :only_young => true })

    super
  end

  def show
    @child = Child.find_by_number(params[:number])

    super
  end

  alias_method :template, :action_name
end
