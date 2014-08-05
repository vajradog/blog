class PostsControllerTest < ActionController::TestCase

	test "redirected to root_path on new post page if not admin" do
	  get :new
	  #assert_response :redirect 
	  assert_redirected_to root_path

	end

	test "success on index page, admin or not" do 
		get :index
		assert_response :success
	end

	test "should create post" do 
		Post.create(title:"This is a title", body:"This is a body")
		assert_response :success
		#assert_redirected_to posts_path
	end
end

