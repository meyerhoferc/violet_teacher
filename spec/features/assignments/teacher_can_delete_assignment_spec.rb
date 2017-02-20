require 'rails_helper'

describe "from the course show page" do
  it "teacher can delete as assignment" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    course = Course.create!(title: "Physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    course.assignments.create!(title: "Acceleration Lab Report", point_value: 50)
    visit teacher_course_assignments_path(teacher, course)

    expect(Assignment.count).to eq(1)

    within(".assignments") do
      click_on "Delete"
    end

    expect(current_path).to eq(teacher_course_assignments_path(teacher, course))
    expect(Assignment.count).to eq(0)
  end
end
