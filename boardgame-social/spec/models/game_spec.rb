require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with valid attributes" do
    FactoryGirl.create(:game).should be_valid
  end

  it "is not valid without an game name" do
    FactoryGirl.build(:game, name: nil).should_not be_valid
  end
  it "is not valid without an description" do
    FactoryGirl.build(:game, description: nil).should_not be_valid
  end
  it "is not valid without an image" do
    FactoryGirl.build(:game, image: nil).should_not be_valid
  end
  it "is not valid without a bgg_link" do
    FactoryGirl.build(:game, bgg_link: nil).should_not be_valid
  end
  it "is not valid without a bgg_id" do
    FactoryGirl.build(:game, bgg_id: nil).should_not be_valid
  end
end
