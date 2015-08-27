module AuthenticationHelpers
	def login_as!(user)
		visit "/login"
		fill_in "Username", with: user.name
		fill_in "Password", with: user.password
		click_button "Login"

		expect(page).to have_content("Hi, #{user.username}!")
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end