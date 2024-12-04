require "tailwind_merge"

module ApplicationHelper
  def form_errors(model, attribute)
    render "shared/form_control_errors", model: model, attribute: attribute
  end

  def tw_merge(*classes)
    TailwindMerge::Merger.new.merge(classes)
  end
end
