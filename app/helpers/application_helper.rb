module ApplicationHelper
  def is_active?(action)
    "active-link" if step.to_s == action
  end

  def order_in_progress
    current_user.orders.in_progress.last
  end
end
