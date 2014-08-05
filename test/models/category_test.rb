require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
	test "that if it generates slug before save, it is valid" do 
		category = Category.new(name: "soccer", slug: "soccer")
		assert category.valid?
	end
end