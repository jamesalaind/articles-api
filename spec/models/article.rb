require 'rails_helper'
require 'spec_helper'


describe Article do
  it "has a valid factory" do
    FactoryBot.create(:article).should be_valid
  end
  it "is invalid without a title" do
    FactoryBot.build(:article, title: nil).should_not be_valid
  end
  it "is invalid without a description" do
     FactoryBot.build(:article, title: nil).should_not be_valid
  end
  it "does not allow duplicate titles" do
    FactoryBot.create(:article, title: 'My First Article', description: "Anything goes here")
    FactoryBot.build(:article, title: 'My First Article', description: "Anything goes here but okay").should_not be_valid
  end
end