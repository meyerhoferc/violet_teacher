require 'rails_helper'

describe "user visits /teachers/new" do
  it "the teacher can create an account" do
    visit '/teachers/new'
    fill_in("teacher[name]", with: "Courtney Meyerhofer")
    fill_in("teacher[department]", with: "Science")
    fill_in("teacher[username]", with: "cm")
    fill_in("teacher[password]", with: "pass")

    click_on "Create Account"
    expect(current_path).to eq(teacher_path(Teacher.first))
    expect(page).to have_content("Welcome, Courtney Meyerhofer")
  end
end
