require 'spec_helper'

describe Author do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :website => "value for website"
    }
  end

  it "should create a new instance given valid attributes" do
    Author.create!(@valid_attributes)
  end
end
