module ApplicationHelper
  def page_title
    if content_for?(:title)
      'Skills Inventory | ' + content_for(:title)
    else
      'Skills Inventory'
    end
  end
end
