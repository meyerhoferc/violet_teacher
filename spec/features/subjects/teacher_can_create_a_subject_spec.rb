require 'rails_helper'

describe "logged in teacher visits /subjects/new" do
  it "the teacher can create a new subject" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

    visit new_subject_path

    fill_in("subject[name]", with: "Physics")
    click_on("Create Subject")

    expect(current_path).to eq(subject_path(Subject.first))

    within(".flash_success") do
      expect(page).to have_content("Subject created successfully")
    end

    within("h1") do
      expect(page).to have_content("Subject: Physics")
    end

    within(".courses h3") do
      expect(page).to have_content("All Courses for this Subject")
    end
  end
end
