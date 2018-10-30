module DeviseHelper
  def devise_error_messages!
    if resource.errors.full_messages.any?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved",
                        count: resource.errors.count)
      html = sentence + '<ul>' + messages + '</ul>'
      flash.now[:alert] = html.html_safe
    end
    return ''
  end
end