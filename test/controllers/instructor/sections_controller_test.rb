require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
	
  test "Create section not logged in" do 
  	post :create, :course_id => 'Math'
  	assert_redirected_to new_user_session_path
  end

  # test "Create validation error" do
  # 	course = FactoryGirl.create(:course)
  # 	sign_in course.user

  # 	assert_no_difference "course.sections.count" do
  # 		post :create, :course_id => course.id, :section => {
  # 			:title => ''
  # 		}
  # 	end
  # 	assert_response :unauthorized
  # end

  test "Create section" do
  	course = FactoryGirl.create(:course)
  	sign_in course.user

  	assert_difference "course.sections.count" do
  		post :create, {:course_id => course.id, 
        :section => {
  	       :title => 'Chemistry'
        }
  		}
  	end
  	assert_redirected_to instructor_course_path(course)
  end

  test "update section log in" do
    section = FactoryGirl.create(:section, :title => 'Math')
    put :update, :id => section.id, :section => {:title => 'Algebra'}
    assert_redirected_to new_user_session_path
  end

  test "update section as a different user" do
    course = FactoryGirl.create(:course)
    sign_in course.user

    section = FactoryGirl.create(:section, :title => 'Math')
    put :update, :id => section.id, :section => {:title => 'Trigonometry'}
    assert_response :unauthorized
  end

  test "update section" do
    section = FactoryGirl.create(:section)
    sign_in section.course.user

    put :update, :id => section.id, :section => {:title => 'Math'}
    assert_equal "Math", Section.find(section.id).title
    assert_redirected_to instructor_section_path(section)
  end
end
