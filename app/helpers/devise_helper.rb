module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg)}.join
    return flash.now[:alert] = messages.html_safe
  end
end
