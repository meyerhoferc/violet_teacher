require 'rails_helper'

describe "student can create a new account" do
  scenario "fills in a form" do
    visit new_student_path

    fill_in("student[name]", with: "Razz")
    fill_in("student[grade]", with: 12)
    fill_in("student[username]", with: "user1")
    fill_in("student[password]", with: "p@ssword")

    click_on "Create Account"

    student = Student.find_by(username: "user1")
    expect(current_path).to eq(student_path(student))

    within("h1") do
      expect(page).to have_content("Welcome, Razz")
    end
    within(".my_information") do
      expect(page).to have_content("Grade: 12")
    end
  end
end
