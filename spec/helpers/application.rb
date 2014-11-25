module ApplicationHelper

  def sign_up(email, name)
    User.create(email: email, name: name, password: '12345678', password_confirmation: '12345678')
  end


  def sign_in(email)
    visit '/'
    click_link 'Existing User Login'
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
  end

  def award_regular_badge(name, badge = 'Office Angel')
    sign_in('bob@test.com')
    click_link 'Reward Employee'
      within("#built_in_badges") do
        select name, from: 'badge_user'
        select badge, from: 'badge_name'
        click_button 'Reward'
      end
  end

  def award_custom_badge(name, badge)
    sign_in('bob@test.com')
    click_link 'Reward Employee'
      within("#custom_badges") do
        select name, from: 'badge_user'
        fill_in 'badge_name', with: badge.to_s
        click_button 'Reward'
      end
  end


end