require 'rails_helper'

describe "student sees all assignments for each course" do
  it "from show page" do
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    student = Student.create!(name: "Kurt", grade: 11, username: "supercool", password: "123")
    subject = Subject.create!(name: "science")
    course = Course.create!(title: "Physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    course.assignments.create!(title: "Acceleration Lab Report", point_value: 50)
    course.assignments.create!(title: "Newton's Laws of Motion Test", point_value: 150)
    Enrollment.create!(student: student, course: course)
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)

    visit student_path(student)
    within(".my_courses h3") do
      expect(page).to have_content("Assignments")
    end
  end
end
