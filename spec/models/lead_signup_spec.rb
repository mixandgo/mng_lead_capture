require 'rails_helper'

RSpec.describe LeadSignup, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value("jhondoe@example.com").for(:email )}
  it { should_not allow_value("noemail").for(:email) }
  it { should allow_value(nil, "", "123-123-3213", "1234567890", "(1234)1234456", "1234 123 345", "1234.123.123").for(:phone) }
  it { should_not allow_value("a", "123").for(:phone) }
end
