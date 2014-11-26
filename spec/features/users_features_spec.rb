require 'rails_helper'
require 'helpers/application'
require 'delorean'

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

    it 'can see the last three badges s/he was given' do
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Star Man')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Best Sales')
      click_link 'Sign out'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office Angel'
      expect(page).to have_content 'Star Man'
      expect(page).to have_content 'Best Sales'
    end

    it 'can only see the last three badges s/he was given' do
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Star Man')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Best Sales')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Positive Vibes')
      click_link 'Sign out'
      sign_in('employee@test.com')
      expect(page).to have_content 'Star Man'
      expect(page).to have_content 'Best Sales'
      expect(page).to have_content 'Positive Vibes'
    end

    it 'can see the badge it has been awarded most often' do
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      sign_in('employee@test.com')
      expect(page).to have_content 'Office Angel MOST REWARDED REWARD'
    end

    it 'can see the total number of badges it has been awarded' do
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      sign_in('employee@test.com')
      expect(page).to have_content '2 TOTAL NUMBER OF REWARDS'
    end

    it 'can see how many days have elapsed since they last won an award' do
      award_regular_badge('Test Employee', 'Office Angel')
      click_link 'Sign out'
      sign_in('employee@test.com')
      expect(page).to have_content '0 DAYS SINCE LAST REWARD'
    end

    it 'if not awarded a badge, sees the difference between the current date and the date the user was created' do
      Delorean.time_travel_to(Time.utc(2014,11,26))
      sign_up_with_created_date('test@test.com', 'Test User')
      sign_in('test@test.com')
      expect(page).to have_content '7 DAYS SINCE LAST REWARD'
    end

  end
end
