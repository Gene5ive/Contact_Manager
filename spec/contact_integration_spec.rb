require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path for contact-index page', {:type => :feature}) do
  it('links user to contact-list page') do
    visit('/')
    click_link('See Contact List')
    expect(page).to have_content('Contacts')
  end

  it('links user to add-new-contact page') do
    visit('/')
    click_link('Add New Contact')
    expect(page).to have_content('Add Contacts')
  end
end

describe('path for new contacts form page', {:type => :feature}) do
  it('allows user to peronal info and takes them to contacts list page') do
    visit('/contacts/new')
    fill_in('last_name', with: "Ross")
    fill_in('first_name', with: "Bob")
    fill_in('birth_month', with: "May")
    click_button('Add Contact')
    expect(page).to have_content('Contacts')
  end

  it('links user to individual contact page') do
    visit('/contacts')
    click_link('Ross')
    expect(page).to have_content('Here is all the info on this person:')
  end
end
