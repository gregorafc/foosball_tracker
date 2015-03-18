module Features
  module SessionHelpers
    def signin(login, password)
      visit new_session_path
      fill_in 'Login', with: login
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
