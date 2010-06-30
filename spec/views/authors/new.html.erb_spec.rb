require 'spec_helper'

describe "/authors/new.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:author] = stub_model(Author,
      :new_record? => true,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders new author form" do
    render

    response.should have_tag("form[action=?][method=post]", authors_path) do
      with_tag("input#author_name[name=?]", "author[name]")
      with_tag("input#author_website[name=?]", "author[website]")
    end
  end
end
