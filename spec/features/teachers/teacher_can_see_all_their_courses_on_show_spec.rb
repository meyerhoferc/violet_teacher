require 'rails_helper'

describe "on a teacher's show page" do
  it "they see all their courses" do
    subject = Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    Course.create!(title: "physics", description: "fun motion", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "biology", description: "fun living things", location: "b100", teacher: teacher, subject: subject)
    Course.create!(title: "chemistry", description: "fun chemicals", location: "b100", teacher: teacher, subject: subject)
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    
    visit teacher_path(teacher)

    within(".courses h3") do
      expect(page).to have_content("My Courses")
    end

    within(".courses") do
      expect(page).to have_link("physics")
      expect(page).to have_link("biology")
      expect(page).to have_link("chemistry")
    end

    click_on "chemistry"

    expect(current_path).to eq(course_path(Course.last))
  end
end
