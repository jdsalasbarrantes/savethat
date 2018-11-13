module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Save That Money"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_active_record_error(model, initial_text)
    html = initial_text
    html += "<ul class='error-list'>"
    model.errors.full_messages.each do |error|
      html += "<li>#{error}</li>"
    end
    html += "</ul>"
    html
  end

  def display_money_value(value, account)
    "#{value} #{account.currency}"
  end

end
