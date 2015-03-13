module ApplicationHelper

  def csrf_input
    html = <<-HTML
      <input type="hidden"
         name="authenticity_token"
         value="#{ form_authenticity_token }">
    HTML
    html.html_safe
  end

  def set_form_method(method)
    "<input type=\"hidden\" name=\"_method\" value=\"#{ method }\">".html_safe
  end

end
