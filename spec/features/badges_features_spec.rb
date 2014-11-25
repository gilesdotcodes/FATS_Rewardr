require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

describe 'Badges' do

  before do
    visit '/'
    sign_up('bob@test.com', 'Bob Owner')
    sign_up('employee@test.com', 'Test Employee')
  end

  context 'Owner' do
    it 'can award a single badge' do
      award_regular_badge('Test Employee')
      expect(page).to have_link 'Reward Employee'
      expect(current_path).to eq '/users/show'
    end

    it 'can award a badge to himself or herself' do
      award_regular_badge('Bob Owner')
      expect(page).to have_content 'Office Angel'
    end

    it 'can award a custom badge' do
      award_custom_badge('Test Employee', 'Epic Win')
      expect(page).to have_link 'Reward Employee'
      expect(current_path).to eq '/users/show'
    end

  end

  context 'Employee' do
    it 'can receive a single badge' do
      award_regular_badge('Test Employee')
      click_link 'Sign out'
      visit '/'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office Angel'
    end
    
    it 'can receive multiple badges' do
      award_regular_badge('Test Employee')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Star Man')
      click_link 'Sign out'
      visit '/'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office Angel'
      expect(page).to have_content 'Star Man'
    end
  end


end