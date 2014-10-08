require 'rails_helper'

RSpec.describe Comment, :type => :model do
	describe 'validations' do
		it 'validations comment on lenght text' do	
			expect(FactoryGirl.build(:comment, text: 'a')).not_to be_valid
			expect(FactoryGirl.build(:comment, text: 'b' * 1025)).not_to be_valid
		end
  	end  
end
