require 'rails_helper'

RSpec.describe 'Discover Page' do 
  it 'has a button to discover top rated movies' do 
    user = User.create!(name: 'user', email: 'email')

    VCR.use_cassette('top_rated_movies') do 
      visit "/users/#{user.id}/discover"
      within '#discover' do
        click_button 'Top Rated Movies' 
        binding.pry

        expect(current_path).to eq(user_movies_path(user.id))
      end
    end 
  end 
end 