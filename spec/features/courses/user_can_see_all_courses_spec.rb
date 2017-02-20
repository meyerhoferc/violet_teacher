require 'rails_helper'

describe "when a user visits /courses" do
  it "they see all courses" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "biology", description: "fun living things", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "chemistry", description: "fun chemicals", location: "b100", teacher: teacher, subject: subject)
    visit courses_path

    within("h1") do
      expect(page).to have_content("All Courses")
    end

    within(".courses_physics") do
      expect(page).to have_link("physics")
      expect(page).to have_link("Courtney")
    end

    within(".courses_chemistry") do
      expect(page).to have_link("chemistry")
      expect(page).to have_link("Courtney")
    end

    within(".courses_biology") do
      click_on "biology"
      expect(current_path).to eq(course_path(Course.find_by(title: "biology")))
    end
  end
end
