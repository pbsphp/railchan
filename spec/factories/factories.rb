def r_str
	SecureRandom.hex(3)
end
FactoryGirl.define do
   factory :boards_group do
   		sequence(:name) 		{ |n| "name#{n}" }
		sequence(:description)	{ |n| "description#{n}"}
	end

	factory :board do
   		sequence(:name) 		{ |n| "name#{n}" }
		sequence(:title) 		{ |n| "title#{n}"}
	end

	factory :topic do
   		sequence(:author) 		{ |n| "author#{n}" }
		sequence(:subject) 		{ |n| "subject#{n}"}
		sequence(:email) 		{ |n| "email#{n}"}
		sequence(:ip) 			{ |n| "ip#{n}"}
		sequence(:text) 		{ |n| "text#{n}"}
	end

	factory :comment do
   		sequence(:author) 		{ |n| "author#{n}" }
		sequence(:subject) 		{ |n| "subject#{n}"}
		sequence(:email) 		{ |n| "email#{n}"}
		sequence(:ip) 			{ |n| "ip#{n}"}
		sequence(:text) 		{ |n| "text#{n}"}
	end
end