# encoding: utf-8

module ChildHelper

  def check_adult_child(child)
    now = Date.today
    ' adult' if (now.year * 12 + now.month) - (child.born_on.year * 12 + child.born_on.month) > 18 * 12
  end

end
