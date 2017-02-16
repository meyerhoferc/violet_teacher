require 'rails_helper'

describe "student can delete account" do
  it "when clicking 'delete' from show page" do
    student = Student.create!(name: "Z", grade: 7, username: "supercool", password: "1234")
    allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)

    visit student_path(student)
    click_on("Delete Account")

    within(".flash_danger") do
      expect(page).to have_content("Account Deleted")
    end
    expect(current_path).to eq(new_student_path)
  end
end
