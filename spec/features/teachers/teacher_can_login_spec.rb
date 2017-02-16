require 'rails_helper'

feature "teacher can login" do
  scenario "with valid credentials" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")

    visit '/login-teacher'

    fill_in("Username", with: "c")
    fill_in("Password", with: "123")
    click_on("login")

    expect(current_path).to eq(teacher_path(teacher))
    within("h3") do
      expect(page).to have_content("Welcome, C")
    end
    within(".my_information") do
      expect(page).to have_content("Department: physics")
    end
  end

  scenario "with invalid credentials" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")
    visit '/login-teacher'

    fill_in("Username", with: "c")
    fill_in("Password", with: "pass123")
    click_on("login")

    expect(current_path).to eq(login_teacher_path)

    within(".flash_danger") do
      expect(page).to have_content("Invalid Login Credentials")
    end
  end
end
