require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
 	
 	test "index" do
 		get :index
 		assert_response :success
 	end

 	test "team" do
 		get :team
 		assert_response :success
 	end

 	test "careers" do
 		get :careers
 		assert_response :success
 	end

 	test "privacy" do
 		get :privacy
 		assert_response :success
 	end  

end
