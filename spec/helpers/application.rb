module ApplicationHelper

  def sign_up(email)
    User.create(email: email, password: '12345678', password_confirmation: '12345678')
  end


  def sign_in(email)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: email
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
  end


end