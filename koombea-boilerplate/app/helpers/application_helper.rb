module ApplicationHelper

  #Returns a conditional class for older browsers
  def browser
    user_agent = request.env['HTTP_USER_AGENT']
    case user_agent
      when /MSIE 8.0/ then "oldie ie8" 
      when /MSIE 7.0/ then "oldie ie7" 
      when /MSIE 6.0/ then "oldie ie6"
      else ""
    end
  end

  #Returns the class 'active' for the current page
  def active_page(path)
    "active" if current_page?(path)
  end
  
end
