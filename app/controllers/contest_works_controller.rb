class ContestWorksController < MainController

  def index
    @works ||= ContestWork.order('RANDOM()')
    @selected_work = @works.first.clone

    super
  end

  alias_method :template, :action_name
end
