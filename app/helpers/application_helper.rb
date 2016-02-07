module ApplicationHelper
  def is_active?(action)
    "active-link" if params[:action] == action
  end
end
