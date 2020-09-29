module ApplicationHelper
  def notice(key)
    return "success" if key == "notice"
    return "danger"  if key == "alert"

    ""
  end
end
