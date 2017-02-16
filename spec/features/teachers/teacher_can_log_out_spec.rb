require 'rails_helper'

describe "teacher can log out of account" do
  it "redirects to log in page" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

    visit teacher_path(teacher)
    click_on("Log Out")

    within(".flash_notice") do
      expect(page).to have_content("Logged Out")
    end
    expect(current_path).to eq(login_teacher_path)
  end
end
