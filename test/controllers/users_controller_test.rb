class UsersControllerTest < ActionController::TestCase

	test "only admin can create a user" do 
		get :new
		assert_redirected_to root_path
	end
end