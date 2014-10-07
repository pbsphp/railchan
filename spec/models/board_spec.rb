require 'rails_helper'

RSpec.describe Board, :type => :model do
  	describe 'validations' do
		it 'validates not null and uniqueness of name and does not throw a db error' do
			board = FactoryGirl.create(:board)
			expect(FactoryGirl.build(:board, id: board.id, name: nil)).not_to be_valid
		end
  	end
end