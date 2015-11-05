require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  	
  test "create lesson not logged in" do
  	post :create, :section_id => 'Science'
  	assert_redirected_to new_user_session_path
  end

  test "create lesson validation error" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	section = FactoryGirl.create(:section)
  	assert_no_difference 'section.lessons.count' do
  		post :create, :section_id => section.id, :lesson => {
  			:title => '',
  			:subtitle => ''
  		}  
  	end
  	assert_response :unauthorized
  end

  test "create lesson" do
    course = FactoryGirl.create(:course)
    sign_in course.user

    section = FactoryGirl.create(:section)
    # assert_difference 'section.lessons.count' do
      post :create, :section_id => section.id, 
      :lesson => FactoryGirl.create(:lesson)
    #  section.lessons.create(lesson)
    #end
    assert_redirected_to instructor_course_path(section.course)
    
  end

  test "update not logged in" do
  	lesson = FactoryGirl.create(:lesson, :title => 'Ruby Code')
  	put :update, :id => lesson.id, :lesson => {:title => 'Ruby'}
  	assert_redirected_to new_user_session_path
  end

  test "update as a different user" do
		user = FactoryGirl.create(:user)
		sign_in user
		lesson = FactoryGirl.create(:lesson, :title => 'Ruby Code')
		put :update, :id => lesson.id, :lesson => {:title => 'Ruby'}
		assert_response :unauthorized
	end  
end
