require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
	
  	test "Create section not logged in" do 
  		post :create, :course_id => 'Math'
  		assert_redirected_to new_user_session_path
  	end

  	# test "Create validation error" do
  	# 	user = FactoryGirl.create(:user)
  	# 	sign_in user

  	# 	course = FactoryGirl.create(:course)
  	# 	assert_no_difference "course.sections.count" do
  	# 		post :create, :course_id => course.id, :section => {
  	# 			:title => ''
  	# 		}
  	# 	end
  	# 	assert_response :unauthorized
  	# end

  	# test "Create section" do
  	# 	user = FactoryGirl.create(:user)
  	# 	sign_in user

  	# 	course = FactoryGirl.create(:course)
  	# 	assert_difference "course.sections.count" do
  	# 		post :create, :course_id => course.id, :section => {
  	# 			:title => 'Chemistry'
  	# 		}
  	# 	end
  	# 	assert_redirected_to instructor_course_path(course)
  	# end

end
