class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, {
    student: 0,
    teacher: 1,
    administrator: 2
  }

  belongs_to :school_class, optional: true
  has_many :class_teachers, dependent: :destroy
  has_many :taught_classes, through: :class_teachers, source: :school_class

  validates :role, presence: true
  validates :school_class_id, presence: true, if: :student?
  validates :school_class_id, absence: true, if: -> { teacher? || administrator? }
end
