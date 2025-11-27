module FlashHelper
  def flash_class(type)
    case type
    when "notice" then "info"
    when "alert" then "warning"
    else type
    end
  end
end