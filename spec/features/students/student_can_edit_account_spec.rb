require 'rails_helper'

feature "student edits account" do
  describe "when a student clicks 'edit' from their show" do
    it "they submit  updaetd information" do
      student = Student.create!(name: "Razz", grade: 9, username: "123", password: "pass")
      allow_any_instance_of(ApplicationController).to receive(:current_student).and_return(student)

      visit student_path(student)
      click_on("Edit")

      expect(current_path).to eq(edit_student_path(student))

      fill_in("student[name]", with: "Georgie")
      fill_in("student[grade]", with: 11)
      click_on("Update Information")

      expect(current_path).to eq(student_path(student))

      within("h1") do
        expect(page).to have_content("Welcome, Georgie")
      end
      within(".my_information") do
        expect(page).to have_content("Grade: 11")
      end
    end
  end
end
