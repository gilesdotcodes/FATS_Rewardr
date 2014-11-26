module ApplicationHelper

  def sign_up(email, name)
    User.create(email: email, name: name, password: '12345678', password_confirmation: '12345678')
  end

  def sign_up_with_created_date(email, name)
    User.create(email: email, name: name, password: '12345678', password_confirmation: '12345678', created_at: Time.new(2014, 11, 19))
  end

  def sign_in(email)
    visit '/'
    click_link 'Existing User Login'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: '12345678'
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

  # def register_owner_and_award_regular_badge(name, badge)
  #   visit '/'
  #   click_link 'Sign Up'
  #   fill_in 'Name', with: 'Bob Owner'
  #   fill_in 'Email', with: 'bob@test.com'
  #   fill_in 'Password', with: '12345678'
  #   fill_in 'Password confirmation', with: '12345678'
  #   click_button 'Sign up'
  #   click_link 'Reward Employee'
  #   within("#built_in_badges") do
  #       select name, from: 'badge_user'
  #       select badge, from: 'badge_name'
  #       click_button 'Reward'
  #     end
  #   click_link 'Sign out'
  # end

  # def register_owner
  #   visit '/'
  #   click_link 'Sign Up'
  #   fill_in 'Name', with: 'Bob Owner'
  #   fill_in 'Email', with: 'bob@test.com'
  #   fill_in 'user_password', with: '12345678'
  #   fill_in 'user_password_confirmation', with: '12345678'
  #   click_button 'Sign up'
  # end

end