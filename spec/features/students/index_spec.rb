require "rails_helper"

describe "students index page", type: :feature do
  it "see each student in the system including name, cohort_number, and instructor" do

    @bobby = Teacher.create( name: "Bobby Darin" )
    @ella = Teacher.create( name: "Ella Fitzgerald" )
    @bette = @bobby.students.create( name: "Bette Davis", cohort_number: 1908, age: 45 )
    @elvis = @bobby.students.create( name: "Elvis Presley", cohort_number: 1908, age: 32 )
    @sammy = @ella.students.create( name: "Sammy Davis", cohort_number: 1906, age: 31 )
    @buddy = @bobby.students.create( name: "Buddy Holly", cohort_number: 1906, age: 21 )

    visit '/students'

    within "#student-#{@bette.id}" do
      expect(page).to have_content('Name: Bette Davis')
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructor: Bobby Darin')
    end

    within "#student-#{@elvis.id}" do
      expect(page).to have_content('Name: Elvis Presley')
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructor: Bobby Darin')
    end


    within "#student-#{@sammy.id}" do
      expect(page).to have_content('Name: Sammy Davis')
      expect(page).to have_content('Cohort: 1906')
      expect(page).to have_content('Instructor: Ella Fitzgerald')
    end

    within "#student-#{@buddy.id}" do
      expect(page).to have_content('Name: Buddy Holly')
      expect(page).to have_content('Cohort: 1906')
      expect(page).to have_content('Instructor: Bobby Darin')
    end
  end
end