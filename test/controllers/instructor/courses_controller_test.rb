require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase

	test "new" do
		user = FactoryGirl.create(:user)
		sign_in user
		get :new
		assert_response :success
	end

	test "new not signed in" do
		get :new
		assert_redirected_to new_user_session_path
	end

	test "create not signed in" do
		assert_no_difference 'Course.count' do
			post :create, { :course => {
				:title => 'Ruby',
				:description => 'learn Ruby here',
				:cost => 100
			}
		}
		end
		assert_redirected_to new_user_session_path
	end 

	test "create invalid" do
		user = FactoryGirl.create(:user)
		sign_in user

		assert_no_difference 'Course.count' do
			post :create, { :course => {
				:title => "",
				:description => "",
				:cost => nil
				}
			}
		end
		assert_response :unprocessable_entity
	end 

	test "create course" do
		user = FactoryGirl.create(:user)
		sign_in user

		course = FactoryGirl.create(:course)
		assert_difference "Course.count" do
			post :create, {:course => {
				:title => 'Ruby',
				:description => 'learn Ruby',
				:cost => 100
				}
			}
		end
		courses = Course.last 
		assert_redirected_to instructor_course_path(courses)
		assert_equal 1, user.courses.count
	end 

	test "show found section" do
		section = FactoryGirl.create(:section)
		get :show, :id => section.id
		assert_response :found
	end

	test "show found lesson" do
		lesson = FactoryGirl.create(:lesson)
		get :show, :id => lesson.id
		assert_response :found
	end
end
