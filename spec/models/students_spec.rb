require 'rails_helper'

describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort_number }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :teacher_students }
    it { should have_many(:teachers).through(:teacher_students) }
  end

end