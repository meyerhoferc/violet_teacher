require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:department) }
  it { should validate_uniqueness_of(:username) }
  it { should have_secure_password }
  it { should have_many(:courses) }
end
