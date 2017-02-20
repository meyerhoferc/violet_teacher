require 'rails_helper'

describe "user can delete a subject" do
  it "from the show page" do
    subject = Subject.create!(name: "Algebra")
    expect(Subject.count).to eq(1)

    visit subject_path(subject)
    click_on("Delete")

    expect(Subject.count).to eq(0)
    expect(current_path).to eq(subjects_path)
    expect(page).to_not have_content("Algebra")
  end
end
