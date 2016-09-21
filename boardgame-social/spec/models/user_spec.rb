require 'rails_helper'


RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is not valid without an username" do
    FactoryGirl.build(:user, bgg_username: nil).should_not be_valid
  end
  it "is not valid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is not valid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end

end
