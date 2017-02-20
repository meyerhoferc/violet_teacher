require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should belong_to(:subject) }
  it { should belong_to(:teacher) }
  it { should have_many(:assignments) }
end
