require 'rails_helper'

describe "teacher can delete account" do
  it "when clicking 'delete' from show page" do
    teacher = Teacher.create(name: "C", department: "physics", username: "c", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_teacher).and_return(teacher)

    visit teacher_path(teacher)
    click_on("Delete Account")

    expect(current_path).to eq(new_teacher_path)
  end
end
