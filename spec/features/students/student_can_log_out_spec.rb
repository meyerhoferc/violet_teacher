require 'rails_helper'

describe "student can log out of account" do
  it "redirects to log in page" do
    student = Student.create!(name: "R", grade: 3, username: "pink", password: "anarcy")
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)

    visit student_path(student)
    click_on("Log Out")

    within(".flash_notice") do
      expect(page).to have_content("Logged Out")
    end
    expect(current_path).to eq(login_student_path)
  end
end
