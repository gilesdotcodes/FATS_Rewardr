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
      award_badge('Test Employee')
      expect(page).to have_content 'Success'
    end

    it 'can award a badge to himself or herself' do
      award_badge('Bob Owner')
      expect(page).to have_content 'Office Angel'
    end
  end

  context 'Employee' do
    it 'can receive a single badge' do
      award_badge('Test Employee')
      click_link 'Sign out'
      visit '/'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office Angel'
    end
    
    it 'can receive multiple badges' do
      award_badge('Test Employee')
      click_link 'Sign out'
      award_badge('Test Employee', 'Badge 2')
      click_link 'Sign out'
      visit '/'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office sngel'
      expect(page).to have_content 'Badge 2'
    end
  end


end