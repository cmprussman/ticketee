module AuthenticationHelper
	def login_as!(user)
		visit "/login"
		fill_in "Username", with: user.username
		fill_in "Password", with: user.password
		click_button "Login"

		expect(page).to have_content("Hi, #{user.username}!")
	end
end

module SessionHelper
	def login(user)
		session[:user_id] = user.id
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelper, type: :feature
	c.include SessionHelper, type: :controller
end