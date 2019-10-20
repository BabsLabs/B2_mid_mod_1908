require "rails_helper"

#As a user,
# When I visit '/students'
# Then I see each student in the system including the student's:
#   - name
#   - cohort name (1906, 1808, etc.)
#   - the name of each instructor that they have

describe "students index page", type: :feature do
  it "see each student in the system including name, cohort_number, and instructor" do

    @bobby = Teacher.create( name: "Bobby Darin" )
    @sammy = Teacher.create( name: "Sammy Davis" )
    @bettie = @bobby.students.create( name: "Bettie Davis", cohort_number: 1908, age: 45 )
    @elvis = @bobby.students.create( name: "Elvis Presley", cohort_number: 1908, age: 32 )
    @buddy = @bobby.students.create( name: "Buddy Holly", cohort_number: 1906, age: 21 )
    @ella = @sammy.students.create( name: "Ella Fitzgerald", cohort_number: 1906, age: 31 )

    visit '/students'

    within "#student-#{@bettie.id}" do
      expect(page).to have_content('Name: Bettie Davis')
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructor: Bobby Darin')
    end

    within "#student-#{@elvis.id}" do
      expect(page).to have_content('Name: Elvis Presley')
      expect(page).to have_content('Cohort: 1908')
      expect(page).to have_content('Instructor: Bobby Darin')
    end

    within "#student-#{@buddy.id}" do
      expect(page).to have_content('Name: Buddy Holly')
      expect(page).to have_content('Cohort: 1906')
      expect(page).to have_content('Instructor: Bobby Darin')
    end

    within "#student-#{@ella.id}" do
      expect(page).to have_content('Name: Ella Fitzgerald')
      expect(page).to have_content('Cohort: 1906')
      expect(page).to have_content('Instructor: Sammy Davis')
    end

  end
end