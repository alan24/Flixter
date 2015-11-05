require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  	
  	test "show lesson" do
  		lesson = FactoryGirl.create(:lesson)
  		get :show, :id => lesson.id
  		assert_response :found
  	end

end
