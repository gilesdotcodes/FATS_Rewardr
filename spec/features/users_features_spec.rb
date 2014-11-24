require 'rails_helper'
require 'helpers/application'

include ApplicationHelper

describe 'User' do
  context 'not signed up' do
    it 'can sign up via the homepage' do
      visit ('/users/sign_up')
      click_link('Sign up')
      fill_in('Email', with: 'test@email.com')
      fill_in('Password', with: '12345678')
      fill_in('Password confirmation', with: '12345678')
      click_button('Sign up')
      expect(page).to have_link('Sign out')
    end
  end

  context 'signed up' do
    before do
      sign_up('bob@test.com')
      sign_up('employee@test.com')
    end

    it 'can sign in as employee' do
      sign_in('employee@test.com')
      expect(page).to have_content('Employee Dashboard')
    end

    it 'can sign in as Bob, the owner' do
      sign_in('bob@test.com')
      expect(page).to have_content('Owner Dashboard')
    end

    it 'can sign out if signed in' do
      sign_in('employee@test.com')
      click_link 'Sign out'
      expect(page).to have_link('Sign in')
    end
  end
end




