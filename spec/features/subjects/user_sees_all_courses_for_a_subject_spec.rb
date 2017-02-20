require 'rails_helper'

describe "when a user visits /subjects/:id" do
  it "they see all courses for this subject" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "biology", description: "fun living things", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "chemistry", description: "fun chemicals", location: "b100", teacher: teacher, subject: subject)

    visit subject_path(subject)

    within(".courses") do
      expect(page).to have_link("physics")
      expect(page).to have_link("biology")
      expect(page).to have_link("chemistry")
    end

    click_on "chemistry"
    expect(current_path).to eq(course_path(Course.last))
  end
end
