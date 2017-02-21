require 'rails_helper'

describe "when a user goes to /" do
  it "they see prompts" do
    visit root_path

    within("h1") do
      expect(page).to have_content("Welcome to Violet Teacher")
    end
    within("h2") do
      expect(page).to have_content("The School Run by Teachers")
    end

    within(".login") do
      expect(page).to have_link("Teacher Login")
      expect(page).to have_link("Student Login")
    end

    within(".create_account") do
      expect(page).to have_link("Teacher Sign Up")
      expect(page).to have_link("Student Sign Up")
    end
  end

  it "they see a navbar" do
    visit root_path
    
    within(".navbar") do
      expect(page).to have_link("All Courses")
      expect(page).to have_link("About Our School")
      expect(page).to have_link("Faculty")
    end
  end
end
