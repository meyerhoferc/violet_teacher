require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "is invalid without a name" do
    expect(Subject.new).to be_invalid
  end

  it "is invalid without a unique name" do
    Subject.create!(name: "Physics")
    expect(Subject.new(name: "Physics")).to be_invalid
  end
end
