require 'rails_helper'

describe Teacher, type: :model do
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :teacher_students }
    it { should have_many(:students).through(:teacher_students) }
  end
end