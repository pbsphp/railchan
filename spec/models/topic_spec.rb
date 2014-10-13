require 'rails_helper'

RSpec.describe Topic, :type => :model do
	describe 'validations' do
		it 'validations topic on lenght text' do	
			expect(FactoryGirl.build(:topic, text: 'a')).not_to be_valid
			expect(FactoryGirl.build(:topic, text: 'b' * 1025)).not_to be_valid
		end
  	end  
end