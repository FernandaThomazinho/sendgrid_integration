# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
require 'dotenv/load'
include SendGrid

mail = Mail.new
mail.from = Email.new(email: 'fernanda.thomazinho@codus.com.br')
mail.subject = 'Bem-vindo(a)'
personalization = Personalization.new
personalization.add_to(Email.new(email: 'fernanda.thomazinho@codus.com.br'))
personalization.add_substitution(Substitution.new(key: '<%name%>', value: 'Fernanda'))
personalization.add_substitution(Substitution.new(key: '<%id%>', value: '123'))
mail.add_personalization(personalization)
mail.template_id = '3234e19e-d56b-4298-83c2-8d0b74570322'

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers