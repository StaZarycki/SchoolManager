class ClassTeacher < ApplicationRecord
  belongs_to :school_class
  belongs_to :user

  validates :user_id, uniqueness: { scope: :school_class_id }
  validate :user_must_be_teacher

  private

  def user_must_be_teacher
    return if user.nil?

    unless user.teacher? || user.administrator?
      errors.add(:user, "must be a teacher")
    end
  end
end
