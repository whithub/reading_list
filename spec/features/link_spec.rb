require 'rails_helper'

describe 'creating a new link', type: :feature do
  before(:each) do
    @link_1 = Link.create!(url: "https://www.google.com", status: 0)
    @link_2 = Link.create!(url: "https://www.yahoo.com", status: 1)

    @user = User.create(name: "Whitney",
                        email: 'whit@example.com',
                        password: 'password',
                        password_confirmation: 'password')
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log In"
  end

  it 'has a form on the main page to add a new link' do
    visit '/'

    fill_in "Url", with: "https://www.gmail.com"
    click_on "Submit New Link"

    expect(page).to have_link('https://www.gmail.com')
  end

  xit 'errors if url is not valid' do
    visit '/'

    fill_in "Url", with: "qwerty"
    click_on "Submit New Link"

    expect(page).to have_link('URL not valid')
  end

  it "displays all created links" do
    visit '/'

    expect(page).to have_link("https://www.google.com")
    expect(page).to have_link("https://www.yahoo.com")
  end

#   it 'lets me create a new idea and choose my category with a form' do
#     best_category = FactoryGirl.create(:category, title: 'Best Category')
#     other_category = FactoryGirl.create(:category, title: 'Other Category')
#
#     visit new_idea_path
#     expect(page).to have_text('Post a new idea')
#
#     fill_in('Description', with: 'My new idea')
#     select('Best Category', from: 'Category')
#     click_on('Post Idea')
#
#     expect(current_path).to eql(category_path(best_category))
#     expect(page).to have_text('My new idea')
#   end
#
#   it 'errors if description or category are blank' do
#     visit new_idea_path
#     expect(page).to have_text('Post a new idea')
#
#     fill_in('Description', with: 'My new idea')
#     click_on('Post Idea')
#
#     expect(page).to have_text('Post a new idea')
#     expect(page).to have_text('Category and Description must be present')
#   end
# end
#
# describe 'viewing an idea', type: :feature do
#   it 'only shows ideas created by the logged in user'
#   it 'blocks viewing ideas by other people'
# end
#
# describe 'editing an existing idea', type: :feature do
#   it 'blocks updating ideas that are not owned by the user who created them'
#   it 'allows updating ideas from the original creator'
#
#   it 'allows changing the category and description' do
#     curr_category = FactoryGirl.create(:category, title: 'Current Category')
#     next_category = FactoryGirl.create(:category, title: 'Next Category')
#     existing_idea = FactoryGirl.create(:idea, description: 'Existing Idea', category: curr_category)
#
#     visit edit_idea_path(existing_idea)
#     expect(page).to have_text('Edit Existing Idea')
#
#     fill_in('Description', with: 'Better Idea')
#     select('Next Category', from: 'Category')
#     click_on('Update')
#
#     visit category_path(curr_category)
#     expect(page).to have_no_text('Existing Idea')
#     expect(page).to have_no_text('Better Idea')
#
#     visit category_path(next_category)
#     expect(page).to have_no_text('Existing Idea')
#     expect(page).to have_text('Better Idea')
#   end
#
#   it 'has an edit link next to the idea on the category page' do
#     my_category = FactoryGirl.create(:category, title: 'My Category')
#     existing_idea = FactoryGirl.create(:idea, description: 'Existing Idea', category: my_category)
#
#     visit category_path(my_category)
#     expect(page).to have_link('Edit', href: edit_idea_path(existing_idea))
#   end
# end
#
# describe 'deleting an existing idea', type: :feature do
#   it 'blocks deleting ideas for other users'
#   it 'accepts deleting ideas from the original creator'
#
#   it 'has a delete link' do
#     my_category = FactoryGirl.create(:category, title: 'My Category')
#     existing_idea = FactoryGirl.create(:idea, description: 'Existing Idea', category: my_category)
#
#     visit category_path(my_category)
#     expect(page).to have_link('Delete Idea', href: idea_path(existing_idea))
#   end
#
#   it 'can be deleted (REMOVE AFTER authorization stuff)' do
#     # TODO remove this after authorization stuff
#     my_category = FactoryGirl.create(:category, title: 'My Category')
#     existing_idea = FactoryGirl.create(:idea, description: 'Existing Idea', category: my_category)
#
#     visit category_path(my_category)
#     click_on('Delete Idea')
#
#     visit category_path(my_category)
#     expect(page).to have_no_text('Existing Idea')
#   end
end
