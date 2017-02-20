require 'rails_helper'

describe "when a user visits /courses/:id" do
  it "they can delete a course" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    expect(Course.count).to eq(1)

    visit course_path(Course.last)

    click_on "Delete"

    within(".flash_success") do
      expect(page).to have_content("Course deleted successfully")
    end
    
    expect(Course.count).to eq(0)
    expect(current_path).to eq(courses_path)
  end
end
