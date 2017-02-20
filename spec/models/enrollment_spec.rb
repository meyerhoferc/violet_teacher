require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it {should validate_presence_of(:student)}
  it {should validate_presence_of(:course)}
  it {should belong_to(:student)}
  it {should belong_to(:course)}
end
