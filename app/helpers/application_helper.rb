module ApplicationHelper

  def title string
    content_for(:title, string)
    string
  end 
  
  def back_link title, url
    content_for :back_link, link_to(raw("&larr; #{title}"), url)
  end
  

end
