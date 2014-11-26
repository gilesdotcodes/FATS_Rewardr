require 'rails_helper'
require 'helpers/application'
require 'delorean'

include ApplicationHelper

describe 'Profile page' do

  context 'when a user has not signed in' do
  
    it 'should prompt user to sign in' do
      visit '/users/profile'
      expect(page).to have_content('User Login')
      expect(current_path).to eq('/users/sign_in')
    end

  end

  context 'when a user has signed in' do

    before do
      sign_up('bob@test.com', 'Bob Owner')
      sign_up('employee@test.com', 'Test Employee')
      sign_in('employee@test.com')
      visit '/users/profile'
    end

    it 'should contain the name of the user' do
      expect(page).to have_content('Test Employee')
    end

    it 'should contain a link back to the personal dashboard of the user' do
      expect(page).to have_link('Dashboard')
    end

    it 'should contain a link to the Edit Profile form' do
      expect(page).to have_link('Edit Profile')
    end

    it 'should allow user to click link to visit Edit Profile form' do
      click_link('Edit Profile')
      expect(current_path).to eq('/users/edit')
    end

    it 'should allow the user to click link to visit Dashboard' do
      click_link('Dashboard')
      expect(current_path).to eq('/users/show')
    end

    context 'the Recent News section' do

      it 'should list badges given to all employees' do
        click_link 'Dashboard'
        click_link 'Sign out'
        award_3_badges
        sign_in('employee@test.com')
        visit '/users/profile'
        within('#recent-news') do
          expect(page).to have_content('Star Man earned by Test Employee')
          expect(page).to have_content('Office Angel earned by Bob Owner')
        end
      end

      it 'should display a notice if no badges have been given' do
        within('#recent-news') do
          expect(page).to have_content('There are no recent news items!')
        end
      end

    end

    context 'the My Badges Archive section' do

      it 'should list all badges user has been given' do
        click_link 'Dashboard'
        click_link 'Sign out'
        award_3_badges
        sign_in('employee@test.com')
        visit '/users/profile'
        within('#my-badges-archive') do
          expect(page).to have_content('Earned Star Man')
          expect(page).to have_content('Earned Office Angel')
        end
      end

      it 'should display a notice if no badges have been received' do
        within('#my-badges-archive') do
          expect(page).to have_content('You have not won any badges yet!')
        end
      end

    end

    context 'the Edit Profile form' do

      it 'should allow user to update his or her name' do
        click_link 'Edit Profile'
        fill_in 'Name', with: 'New Employee'
        click_button 'Update'
        expect(page).to have_content('Thank you! Your profile has been successfully updated.')
      end

      it 'should allow user to update his or her email address' do
        click_link 'Edit Profile'
        fill_in 'Email', with: 'new_employee@test.com'
        click_button 'Update'
        expect(page).to have_content('Thank you! Your profile has been successfully updated.')
      end

      it 'should allow user to update his or her password' do
        click_link 'Edit Profile'
        fill_in 'Password', with: 'abcd1234'
        fill_in 'Password confirmation', with: 'abcd1234'
        click_button 'Update'
        expect(page).to have_content('Thank you! Your profile has been successfully updated.')
        expect(current_path).to eq('/users/show')
      end

    end

  end

end
