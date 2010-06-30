require 'spec_helper'

describe Post do
  before(:each) do
    @valid_attributes = {
      :author_id => 1,
      :title => "value for title",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
