module ApplicationHelper
  def is_active?(action)
    "active-link" if params[:action] == action
  end

  def order_in_progress
    current_user.orders.in_progress.last
  end
end
