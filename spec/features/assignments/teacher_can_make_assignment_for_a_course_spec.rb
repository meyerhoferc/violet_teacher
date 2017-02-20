require 'rails_helper'

describe "teacher can make assignment for a course" do
  it "when logged in" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    course = Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    expect(Assignment.count).to eq(0)
    visit new_teacher_course_assignment_path(teacher, course)

    fill_in("assignment[title]", with: "Velocity Lab Report")
    fill_in("assignment[point_value]", with: "50")
    click_on "Create Assignment"

    expect(Assignment.count).to eq(1)
    expect(current_path).to eq(teacher_course_assignment_path(teacher, course, Assignment.last))

    within(".flash_success") do
      expect(page).to have_content("Assignment created successfully")
    end

    within("h1") do
      expect(page).to have_content("Assignment: Velocity Lab Report")
    end

    within("h3") do
      expect(page).to have_content("50 Points")
    end
  end
end
