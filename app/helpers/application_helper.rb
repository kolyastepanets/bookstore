module ApplicationHelper
  def is_active?(action)
    "active-link" if step.to_s == action
  end

  def render_stars(value)
    output = ''
    number = 5 - value
    value.times do
      output += image_tag("black.png", size: "20x20")
    end
    number.times do
      output += image_tag("gray.png", size: "20x20")
    end
    output.html_safe
  end

end
