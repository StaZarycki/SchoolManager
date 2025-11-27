module ApplicationHelper
  def error_message_for(object, attribute)
    return unless object.errors[attribute].any?

    content_tag(:span, object.errors.full_messages_for(attribute).first, class: "text-error text-sm")
  end
end
