module Admin::UsersHelper
  def badge_class_for_role(role)
    case role
    when "administrator"
      "badge-accent"
    when "teacher"
      "badge-primary"
    when "student"
      "badge-secondary"
    else
      "badge-ghost"
    end
  end
end