require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        body: "Body",
        picture: "Picture",
        user: nil
      ),
      Post.create!(
        title: "Title",
        body: "Body",
        picture: "Picture",
        user: nil
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: "Picture".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
