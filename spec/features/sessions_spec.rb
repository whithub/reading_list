require 'rails_helper'

describe "Sessions", type: :feature do

  context "when user logs in" do
    context "if user exists" do
      it "logs in user" do
        User.create!(name: "Justin",
                    email: 'justin@example.com',
                    password: 'password',
                    password_confirmation: 'password')

        visit '/login'
        fill_in 'session_email', with: 'justin@example.com'
        fill_in 'session_password', with: 'password'
        click_button "Log In"

        expect(current_path).to eq root_path
      end
    end

    context "if user does not exist" do
      it "returns error message" do
        visit '/login'
        fill_in 'session_email', with: 'whitney@example.com'
        fill_in 'session_password', with: 'password'
        click_button "Log In"

        page.should have_content "Email and/or Password were invalid."
      end
    end
  end

  context "when user is logged in" do
    it "can log out" do
      User.create!(name: "Justin",
                   email: 'justin@example.com',
                   password: 'password',
                   password_confirmation: 'password')

      visit '/login'
      fill_in 'session_email', with: 'justin@example.com'
      fill_in 'session_password', with: 'password'
      click_button "Log In"

      click_on "Logout"

      page.should have_content "Logged out."
      expect(current_path).to eq('/welcome')
      page.should have_content "Please Sign Up or Log In"
    end
  end
end
