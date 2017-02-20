require 'rails_helper'

describe "a student can sign up for a course" do
  it "when logged in" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    student = Student.create!(name: "R", grade: 3, username: "pink", password: "anarchy")
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)

    visit new_enrollment_path

    select("physics", from: "enrollment[course_id]")
    click_on "Enroll"

    expect(current_path).to eq(student_path(student))

    within(".flash_success") do
      expect(page).to have_content("Enrollment successful")
    end

    expect(current_path).to eq(student_path(student))

    within(".my_courses") do
      expect(page).to have_link("physics")
    end

    click_on "physics"

    expect(current_path).to eq(course_path(Course.last))
  end

  it "when not logged in" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    student = Student.create!(name: "R", grade: 3, username: "pink", password: "anarchy")

    visit new_enrollment_path

    select("physics", from: "enrollment[course_id]")
    click_on "Enroll"

    within(".flash_danger") do
      expect(page).to have_content("You must be logged in to enroll in a course")
    end

    expect(current_path).to eq(login_student_path)
  end
end
