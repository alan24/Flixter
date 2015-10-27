FactoryGirl.define do
	factory :user do 
		sequence :email do |n|
			"alan#{n}@gmail.com"
		end
		password "omglolhaha"
		password_confirmation "omglolhaha"
	end

	factory :course do
		title "Chemistry"
		description "Mix chemicals"
		cost 50
		association :user
	end

end