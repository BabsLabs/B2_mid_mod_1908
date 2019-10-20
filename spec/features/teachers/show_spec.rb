require 'rails_helper'

describe "Instructor show page" do
  it "can see instructor's name, list of their students names, and average age of their students" do

    @bobby = Teacher.create( name: "Bobby Darin" )
    @ella = Teacher.create( name: "Ella Fitzgerald" )
    @bette = @bobby.students.create( name: "Bette Davis", cohort_number: 1908, age: 40 )
    @elvis = @bobby.students.create( name: "Elvis Presley", cohort_number: 1908, age: 30 )
    @sammy = @ella.students.create( name: "Sammy Davis", cohort_number: 1906, age: 31 )
    @buddy = @bobby.students.create( name: "Buddy Holly", cohort_number: 1906, age: 20 )

    visit '/students'

    expect(page).to have_link('Ella Fitzgerald')

    within "#student-#{@bette.id}" do
      expect(page).to have_link('Bobby Darin')
      click_link('Bobby Darin')
    end

    expect(current_path).to eq("/teachers/#{@bobby.id}")
    expect(page).to have_content('Bobby Darin')
    expect(page).to have_content('Bette Davis')
    expect(page).to have_content('Elvis Presley')
    expect(page).to have_content('Buddy Holly')
    expect(page).to have_content('Average Student Age: 30')

  end
end