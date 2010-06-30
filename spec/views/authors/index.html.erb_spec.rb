require 'spec_helper'

describe "/authors/index.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:authors] = [
      stub_model(Author,
        :name => "value for name",
        :website => "value for website"
      ),
      stub_model(Author,
        :name => "value for name",
        :website => "value for website"
      )
    ]
  end

  it "renders a list of authors" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
  end
end
