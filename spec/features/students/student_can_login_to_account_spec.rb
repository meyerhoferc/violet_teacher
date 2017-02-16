require 'rails_helper'

feature "student can login to account" do
  scenario "with valid credentials" do
    student = Student.create!(name: "Courtney", grade: 11, username: "R", password: "123")
    visit login_student_path

    fill_in "Username", with: "R"
    fill_in "Password", with: "123"
    click_on "login"

    expect(current_path).to eq(student_path(student))
  end

  scenario "with invalid credentials" do
    student = Student.create!(name: "Courtney", grade: 11, username: "R", password: "123")
    visit login_student_path

    fill_in "Username", with: "R"
    fill_in "Password", with: "password"
    click_on "login"

    expect(current_path).to eq(login_student_path)

    within(".flash_danger") do
      expect(page).to have_content("Invalid Login Credentials")
    end
  end
end
