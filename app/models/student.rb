class Student < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cohort_number
  validates_presence_of :age

  has_many :teacher_students
  has_many :teachers, through: :teacher_students
end