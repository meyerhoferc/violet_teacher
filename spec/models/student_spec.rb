require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      student = Student.new(username: "C", password: "123", grade: 10)
      expect(student).to be_invalid
    end

    it "is invalid without a username" do
      student = Student.new(name: "C", password: "123", grade: 10)
      expect(student).to be_invalid
    end

    it "is invalid without a password" do
      student = Student.new(name: "C", username: "RR", grade: 9)
      expect(student).to be_invalid
    end

    it "is invalid without a grade" do
      student = Student.new(name: "C", username: "RR", password: "pass")
      expect(student).to be_invalid
    end

    it "is invalid with a non-unique username" do
      Student.create!(name: "C", username: "RR", password: "123", grade: 8)
      student = Student.new(name: "R", username: "RR", password: "123", grade: 3)
      expect(student).to be_invalid
    end
  end
end
