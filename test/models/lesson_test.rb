require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  
  	test "Title validation error" do
  		lesson = FactoryGirl.build(:lesson, :title => "")
  		isValid = lesson.valid?
  		assert_equal false, isValid
  	end
end
