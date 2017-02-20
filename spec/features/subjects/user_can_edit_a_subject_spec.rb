require 'rails_helper'

describe "user visits /subjects/:id/edit" do
  it "fills in a form to update subject information" do
    subject = Subject.create!(name: "Physics")
    Subject.create!(name: "Algebra")

    visit edit_subject_path(subject)

    fill_in("subject[name]", with: "Calculus")

    click_on("Update Subject")

    expect(current_path).to eq(subject_path(subject))
    within("h1") do
      expect(page).to have_content("Subject: Calculus")
    end
  end
end
