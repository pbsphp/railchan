require 'rails_helper'

RSpec.describe BoardsGroup, :type => :model do
  	describe 'validations' do
		it 'validates not null and uniqueness of name and does not throw a db error' do
			boards_group = FactoryGirl.create(:boards_group)
			expect(FactoryGirl.build(:boards_group, id: boards_group.id, name: nil)).not_to be_valid
		end
  	end
end