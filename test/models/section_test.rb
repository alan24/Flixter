require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  	
  	test "Title Validation Error" do
  		section = FactoryGirl.build(:section, :title => '')
  		isValid = section.valid?
  		assert_equal false, isValid
  	end
end
