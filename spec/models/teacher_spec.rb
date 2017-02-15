require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        teacher = Teacher.new(department: "science", username: "c", password: "pass")
        expect(teacher).to_not be_valid
      end

      it "is invalid with a department" do
        teacher = Teacher.new(name: "Courtney", username: "c", password: "pass")
        expect(teacher).to_not be_valid
      end

      it "is invalid without a username" do
        teacher = Teacher.new(name: "Courtney", department: "science", password: "pass")
        expect(teacher).to_not be_valid
      end

      it "is invalid without a password" do
        teacher = Teacher.new(name: "Courtney", department: "science", username: "C")
        expect(teacher).to_not be_valid
      end

      it "is invalid with a non-unique username" do
        Teacher.create!(name: "C", department: "Science", username: "c", password: "123")
        expect(Teacher.new(name: "c", department: "Sci", username: "c", password: "pass")).to_not be_valid
      end
    end
  end
end
