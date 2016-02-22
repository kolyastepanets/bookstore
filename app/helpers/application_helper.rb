module ApplicationHelper
  def is_active?(action)
    "active-link" if step.to_s == action
  end
end
