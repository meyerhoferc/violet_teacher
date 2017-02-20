require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:point_value) }
  it { should validate_presence_of(:course) }
  it { should validate_uniqueness_of(:title) }
  it { should belong_to(:course) }
end
