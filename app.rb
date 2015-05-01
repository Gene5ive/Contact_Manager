require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/phone')
require('./lib/contact')
require('./lib/address')
require('pry')

get('/') do
  erb(:index)
end

get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all
  erb(:contacts)
end

post('/contacts') do
  last_name = params.fetch('last_name')
  first_name = params.fetch('first_name')
  birth_month = params.fetch('birth_month')
  Contact.new(last_name, first_name, birth_month).save()
  @contacts = Contact.all
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/address/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:address_form)
end

get('/contacts/:id/phone_number/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_form)
end

# post('/vehicles') do
#   make = params.fetch('make')
#   model = params.fetch('model')
#   year = params.fetch('year')
#   @vehicle = Vehicle.new(make, model, year)
#   @vehicle.save()
#   @dealership = Dealership.find(params.fetch('dealership_id').to_i())
#   @dealership.add_vehicle(@vehicle)
#   erb(:success)
# end
