class Teacher < ApplicationRecord
  validates_presence_of :name

  has_many :teacher_students
  has_many :students, through: :teacher_students
end