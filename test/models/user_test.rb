require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "that all users are not admin" do 
		user = User.new(username: "john", password: "secret")
		refute user.admin?, "User is not an admin"
	end

	test "that all users with specified admin role are admin" do 
		user = User.new(username: "john", password: "secret", role:"admin")
		assert user.admin?, "User is an admin"
	end
end