require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

describe 'User' do
  context 'not signed up' do
    it 'can sign up via the homepage' do
      sign_up('employee@test.com', 'Test Employee')
      sign_in('employee@test.com')
      expect(page).to have_content('Personal Dashboard')
    end
  end

  context 'signed up' do
    before do
      sign_up('bob@test.com', 'Bob Owner')
      sign_up('employee@test.com', 'Test Employee')
    end

    it 'can sign in as employee' do
      sign_in('employee@test.com')
      expect(page).to have_content('Personal Dashboard')
    end

    it 'can sign in as Bob, the owner' do
      sign_in('bob@test.com')
      expect(page).to have_content('Personal Dashboard')
    end

    it 'can sign out if signed in' do
      sign_in('employee@test.com')
      click_link 'Sign out'
      expect(page).to have_link('Sign in')
    end
  end
end




