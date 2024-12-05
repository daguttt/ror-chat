require "tailwind_merge"

module ApplicationHelper
  def form_errors(model, attribute)
    render "shared/form_control_errors", model: model, attribute: attribute
  end

  def tw_merge(*classes)
    TailwindMerge::Merger.new.merge(classes)
  end

  def html_to_plain_text(html)
    ActionText::Content.new(html).to_plain_text
  end
end
