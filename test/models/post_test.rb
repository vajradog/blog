require 'test_helper'

class PostTest < ActiveSupport::TestCase
	test "that with a title and body it is valid" do 
		post = Post.new(title: "this is a title", body: "this is a body")
		assert post.valid?
	end

	test "that with a title and without a body it not valid" do
		post = Post.new(title: "this is a title", body: "")
		assert_not post.valid?
	end

	test "that without a title it is not valid" do
		post = Post.new(title:"", body:"body")
		assert_not post.valid?, "no title"
	end
end