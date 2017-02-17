require 'rails_helper'

describe 'user visits /subjects' do
  it "sees a list of all subjects with links to show page" do
    subject = Subject.create!(name: "Physics")
    Subject.create!(name: "Algebra")

    visit subjects_path

    within("h1") do
      expect(page).to have_content("All Subjects")
    end

    expect(page).to have_link("Physics")
    expect(page).to have_link("Algebra")

    click_on("Physics")

    expect(current_path).to eq(subject_path(subject))
  end
end
