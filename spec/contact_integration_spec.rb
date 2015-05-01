require('capybara/rspec')
require('./app')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('paths for contact-index page', {:type => :feature}) do
  it('links user to contact-list page') do
    visit('/')
    click_link('See Contact List')
    expect(page).to have_content('Contacts')
  end

  it('links user to new-contact page') do
    visit('/')
    click_link('Add New Contact')
    expect(page).to have_content('Add Contacts')
  end
end

describe('paths for new-contact, contact-list pages, and individual info pages', {:type => :feature}) do
  it('allows user to enter info and takes them to contact-list page') do
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

  it('links user to add new address page') do
    visit('/contacts/:id')
    click_link('Add a new address')
    expect(page).to have_content('Add Address')
  end

  it('links user to add new phone number page') do
    visit('/contacts/:id')
    click_link('Add a new phone number')
    expect(page).to have_content('Add Phone Number')
  end
end
#
# describe('paths for individual contact page') do
#   click_link
