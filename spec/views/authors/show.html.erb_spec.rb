require 'spec_helper'

describe "/authors/show.html.erb" do
  include AuthorsHelper
  before(:each) do
    assigns[:author] = @author = stub_model(Author,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ website/)
  end
end
