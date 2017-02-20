require 'rails_helper'

describe "when a user visits /courses/:id" do
  it "they can delete a course" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    expect(Course.count).to eq(1)

    visit teacher_course_path(teacher, Course.last)

    click_on "Delete"

    within(".flash_success") do
      expect(page).to have_content("Course deleted successfully")
    end

    expect(Course.count).to eq(0)
    expect(current_path).to eq(teacher_courses_path(teacher))
  end
end
