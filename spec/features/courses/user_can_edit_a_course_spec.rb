require 'rails_helper'

describe "user can edit an existing course" do
  it "by submitting new information" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Teacher.create!(name: "Maria", department: "science", username: "m", password: "pass")
    course = Course.create!(title: "physics", description: "fun", location: "b100", teacher: teacher, subject: subject)
    visit course_path(course)
    click_on "Edit"

    fill_in("course[title]", with: "Biology")
    select("Maria", from: "course[teacher_id]")
    click_on "Update Course"

    expect(current_path).to eq(course_path(course))
    
    within(".flash_success") do
      expect(page).to have_content("Course updated successfully")
    end

    within("h1") do
      expect(page).to have_content("Course: Biology")
    end

    within(".course_info") do
      expect(page).to have_content("Teacher: Maria")
    end
  end
end
