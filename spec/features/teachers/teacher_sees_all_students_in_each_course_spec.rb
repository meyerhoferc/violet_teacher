require 'rails_helper'

describe "teacher sees goes to /my_courses" do
  it "they see all students in that course" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    course = Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    student_1 = Student.create!(name: "Bob", grade: 3, username: "pink", password: "anarchy")
    student_2 = Student.create!(name: "George", grade: 3, username: "blue", password: "anarchy")
    Enrollment.create!(student: student_1, course: course)
    Enrollment.create!(student: student_2, course: course)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

    visit teacher_courses_path(teacher)
    save_and_open_page
    within("h1") do
      expect(page).to have_content("My Courses")
    end

    within(".course_physics") do
      expect(page).to have_link("physics")
      expect(page).to have_content("Enrollment: 2 students")
    end

    within(".course_physics") do
      expect(page).to have_content("Bob")
      expect(page).to have_content("George")
    end

    click_on "physics"

    expect(current_path).to eq(teacher_course_path(teacher, course))
  end
end
