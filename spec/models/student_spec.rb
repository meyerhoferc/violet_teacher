require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:grade) }
  it { should have_many(:enrollments) }
  it { should have_secure_password }
end
