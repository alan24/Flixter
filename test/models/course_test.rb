require 'test_helper'

class CourseTest < ActiveSupport::TestCase

	test "Title Validation error" do
		course = FactoryGirl.build(:course, :title => "")
		isValid = course.valid? 
		assert_equal false, isValid
	end

	test "Course is free" do
		course = FactoryGirl.create(:course, :cost => 0)
		assert_equal true, course.free?
	end 

	test "Course is free error" do
		course = FactoryGirl.create(:course, :cost => 1)
		assert_equal false, course.free?
	end

	test "Cost Validation error" do
		course = FactoryGirl.build(:course, :cost => -1)
		isValid = course.valid?
		assert_equal false, isValid
	end 

	test "Description Validation error" do
		course = FactoryGirl.build(:course, :description => "")
		isValid = course.valid?
		assert_equal false, isValid
	end

end
