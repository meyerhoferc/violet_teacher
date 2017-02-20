require 'rails_helper'

feature "teacher edits account" do
  describe "when a teacher clicks 'edit' from their show" do
    it "they submit a form with updated information" do
      teacher = Teacher.create!(name: "Courtney", department: "physics", username: "c", password: "pass")
      allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

      visit teacher_path(teacher)

     click_on("Edit")

     expect(current_path).to eq(edit_teacher_path(teacher))

     fill_in("teacher[name]", with: "Kurt")
     fill_in("teacher[department]", with: "Art")
     click_on("Update Information")

     expect(current_path).to eq(teacher_path(teacher))
     within("h3") do
       expect(page).to have_content("Welcome, Kurt")
     end
     within(".my_information") do
       expect(page).to have_content("Department: Art")
     end
    end
  end
end
