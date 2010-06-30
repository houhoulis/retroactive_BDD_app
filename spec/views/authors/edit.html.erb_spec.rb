require 'spec_helper'

describe "/authors/edit.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:author] = @author = stub_model(Author,
      :new_record? => false,
      :name => "value for name",
      :website => "value for website"
    )
  end

  it "renders the edit author form" do
    render

    response.should have_tag("form[action=#{author_path(@author)}][method=post]") do
      with_tag('input#author_name[name=?]', "author[name]")
      with_tag('input#author_website[name=?]', "author[website]")
    end
  end
end
