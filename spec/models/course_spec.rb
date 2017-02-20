require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      subject = Subject.create!(name: "science")
      teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
      course = Course.new(description: "fun",
                              location: "b100",
                              teacher: teacher,
                              subject: subject)
      expect(course).to be_invalid
    end

    it "is invalid without a description" do
      subject = Subject.create!(name: "science")
      teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
      course = Course.new(title: "physics",
                              location: "b100",
                              teacher: teacher,
                              subject: subject)
      expect(course).to be_invalid
    end

    it "is invalid without a subject" do
      teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
      course = Course.new(title: "physics",
                              location: "b100",
                              teacher: teacher,
                              description: "subject")
      expect(course).to be_invalid
    end

    it "is invalid without a location" do
      subject = Subject.create!(name: "science")
      teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
      course = Course.new(title: "physics",
                              subject: subject,
                              teacher: teacher,
                              description: "subject")
      expect(course).to be_invalid
    end

    it "is invalid without a teacher" do
      subject = Subject.create!(name: "science")
      course = Course.new(title: "physics",
                              subject: subject,
                              location: "d215",
                              description: "subject")
      expect(course).to be_invalid
    end
  end

  describe "uniqueness" do
    it "is invalid with a non-unique title" do
      subject = Subject.create!(name: "science")
      teacher = Teacher.create!(name: "Courtney", department: "science", username: "c", password: "pass")
      Course.create!(title: "physics",
                          subject: subject,
                          location: "d215",
                          description: "very fun",
                          teacher: teacher)
      course = Course.new(title: "physics",
                          subject: subject,
                          location: "d215",
                          description: "very fun",
                          teacher: teacher)
      expect(course).to be_invalid
    end
  end
end
