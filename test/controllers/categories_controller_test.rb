class CategoriesControllerTest < ActionController::TestCase

	test "only admin can create a category" do 
		get :new
		assert_redirected_to root_path
	end

	test "should create category" do 
    Category.create(name:"some category")
    assert_response :success
  end
end