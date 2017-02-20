require 'rails_helper'

describe "user can create a new course" do
  it "by filling out form" do
    visit new_course_path
    Subject.create!(name: "science")
    Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")

    fill_in("course[subject]", with: "science")
    fill_in("course[title]", with: "Physics")
    fill_in("course[description]", with: "learn fun things")
    fill_in("course[location]", with: "B100")
    fill_in("course[teacher]", with: "Courtney")
    click_on("Create Course")

    course = Course.last
    expect(current_path).to eq(course_path(course.id))

    within(".flash_success") do
      expect(page).to have_content("Course created successfully")
    end
    within("h1") do
      expect(page).to have_content("Course: Physics")
    end

    within(".course_info") do
      expect(page).to have_content("Description: learn fun things")
      expect(page).to have_content("Subject: science")
      expect(page).to have_content("Location: B100")
      expect(page).to have_content("Teacher: Courtney")
    end
  end
end
