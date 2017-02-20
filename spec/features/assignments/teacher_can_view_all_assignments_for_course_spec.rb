require 'rails_helper'

describe "from the course show page" do
  it "the teacher can see all assignments for this course" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    course = Course.create!(title: "Physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    course.assignments.create!(title: "Acceleration Lab Report", point_value: 50)
    course.assignments.create!(title: "Newton's Laws of Motion Test", point_value: 150)

    visit teacher_course_assignments_path(teacher, course)

    within("h1") do
      expect(page).to have_content("All Assignments for Physics")
    end

    within(".assignments") do
      expect(page).to have_link("Acceleration Lab Report")
      expect(page).to have_content("50 Points")
      expect(page).to have_link("Newton's Laws of Motion Test")
      expect(page).to have_content("150 Points")
    end
  end
end
