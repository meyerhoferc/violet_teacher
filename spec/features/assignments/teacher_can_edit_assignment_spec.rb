require 'rails_helper'

describe "teacher can edit existing assignment" do
  it "by filling in a form" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    course = Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    assignment = course.assignments.create!(title: "Acceleration Lab Report", point_value: 50)

    visit edit_teacher_course_assignment_path(teacher, course, assignment)
    fill_in("assignment[point_value]", with: 100)
    click_on "Update Assignment"

    expect(current_path).to eq(teacher_course_assignment_path(teacher, course, assignment))

    within("h3") do
      expect(page).to have_content("100 Points")
    end
  end
end
