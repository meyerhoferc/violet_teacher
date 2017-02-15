require 'rails_helper'

feature "teacher can login" do
  it "as an existing user" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")

    visit '/login-teacher'

    fill_in("teacher[username]", with: "c")
    fill_in("teacher[password]", with: "123")
    click_on("login")
    
    expect(current_path).to eq(teacher_path(teacher))
    within("h3") do
      expect(page).to have_content("Welcome, Kurt")
    end
    within(".my_information") do
      expect(page).to have_content("Department: Art")
    end
  end
end
