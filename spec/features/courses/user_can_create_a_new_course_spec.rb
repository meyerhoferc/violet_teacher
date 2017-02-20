require 'rails_helper'

describe "user can create a new course" do
  it "by filling out form" do
    Subject.create!(name: "science")
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

    visit new_teacher_course_path(teacher)
    select("science", from: "course[subject_id]")
    fill_in("course[title]", with: "Physics")
    fill_in("course[description]", with: "learn fun things")
    fill_in("course[location]", with: "B100")
    click_on("Create Course")

    course = Course.last
    expect(current_path).to eq(teacher_course_path(teacher, course))

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

describe "user cannot create a new course" do
  it "when giving incomplete information" do
    teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)
    
    visit new_teacher_course_path(teacher)

    fill_in("course[title]", with: "Physics")
    fill_in("course[description]", with: "learn fun things")
    fill_in("course[location]", with: "B100")
    click_on("Create Course")

    within(".flash_danger") do
      expect(page).to have_content("Course not created!")
    end
  end
end
