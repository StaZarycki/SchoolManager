class SchoolClass < ApplicationRecord
  has_many :students, -> { where(role: :student) }, class_name: "User"
  has_many :class_teachers, dependent: :destroy
  has_many :teachers, through: :class_teachers, source: :user

  validates :name, presence: true, uniqueness: true
end
