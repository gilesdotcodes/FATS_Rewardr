require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

describe 'Owner' do
  context 'awarding badges' do
    it 'can award a single badge' do
      visit '/'
      sign_up('bob@test.com')
      sign_up('employee@test.com')
      sign_in('bob@test.com')
      click_link 'Reward Employee'
      select 'employee@test.com', from: 'badge_user'
      select 'Office angel', from: 'badge_name'
      click_button 'Reward'
      expect(page).to have_content 'Success'
    end
  end
end

describe 'Staff member' do
  context 'receiving badges' do
    it 'can see the badge it has received' do
      visit '/'
      sign_up('employee@test.com')
      sign_in('employee@test.com')
      expect(page).to have_content 'Office angel'
    end
  end
end