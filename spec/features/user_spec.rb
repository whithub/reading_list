require 'rails_helper'

describe 'signup', type: :feature do

  it 'has a link on the login page that links to a sign up form' do
    visit '/welcome'
    expect(page).to have_link('Sign Up', new_user_path)

    click_on "Sign Up"
    expect(page).to have_text('Create a new account')
    expect(current_path).to eq('/users/new')
  end

  it 'asks for a name, email, and password' do
    visit '/users/new'
    expect(page).to have_text('Create a new account')

    fill_in "Name", with: "Whitney"
    fill_in "Email", with: "whit@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, Whitney")
  end

  it 'errors if name, email, or password are blank' do
    visit new_user_path
    click_button "Create Account"

    expect(page).to have_text('Create a new account')
    expect(page).to have_text('Name, Email or Password cannot be blank. Please fill in all fields.')
  end
end


describe 'unregistered user', type: :feature do
  it 'displays error if email/password do not work' do
    visit login_path

    fill_in "Email", with: "Tom Petty"
    fill_in "Password", with: "freefalling"
    click_button "Log In"


    expect(page).to have_content("Email and/or Password were invalid.")
    expect(current_path).to eq(login_path)
  end
end

describe 'log in', type: :feature do

  before(:each) do
    @user = User.create(name: "Whitney",
                       email: 'whit@example.com',
                       password: 'password',
                       password_confirmation: 'password')
  end

  it "can log in an existing user" do
    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log In"

    expect(page).to have_content("Welcome, Whitney")
  end

  it "can logout a logged in user" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log In"

    expect(page).to have_link("Logout")
    expect(current_path).to eq(root_url)

    click_on "Logout"

    expect(page).to have_content("Welcome to Reading List")
  end

end
