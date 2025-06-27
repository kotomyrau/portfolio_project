module SemanticHelper
  def semantic_class_for(type)
    {
      notice: "info",
      alert: "warning",
      error: "danger",
      success: "success"
    }.fetch(type.to_sym, "secondary")
  end

  def semantic_icon_for(type)
    {
      notice: "icons/info.svg",
      alert: "icons/warning.svg",
      error: "icons/error.svg",
      success: "icons/check_circle.svg"
    }.fetch(type.to_sym, "icons/info.svg")
  end
end
