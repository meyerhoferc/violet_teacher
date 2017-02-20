require 'rails_helper'

describe "user can edit an existing course" do
  it "by submitting new information" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    course = Course.create!(title: "physics", description: "fun", location: "b100", teacher: teacher, subject: subject)
    visit teacher_course_path(teacher, course)
    click_on "Edit"

    fill_in("course[title]", with: "Biology")
    click_on "Update Course"

    expect(current_path).to eq(teacher_course_path(teacher, course))

    within(".flash_success") do
      expect(page).to have_content("Course updated successfully")
    end

    within("h1") do
      expect(page).to have_content("Course: Biology")
    end

    within(".course_info") do
      expect(page).to have_content("Teacher: Courtney")
    end
  end
end
