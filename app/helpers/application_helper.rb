module ApplicationHelper
  def form_group_tag(errors, &block)
# #5
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
