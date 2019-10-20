require "rails_helper"

describe TeacherStudent, type: :model do
  it { should belong_to :teacher }
  it { should belong_to :student }
end