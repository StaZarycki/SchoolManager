module FlashHelper
  def flash_class(type)
    case type
    when "notice" then "info"
    when "alert" then "warning"
    end
  end
end