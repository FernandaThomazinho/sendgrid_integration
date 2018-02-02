require 'dotenv/load'
require 'net/http'

uri = URI('https://api.sendgrid.com/v3/mail/send')
data = '{
    "personalizations": [
      {
        "to": [
          {
            "email": "fernanda.thomazinho@codus.com.br"
          }
        ],
        "substitutions": {
          "<%name%>": "Fernanda",
          "<%id%>": "123"
        },
        "subject": "Bem-vindo(a)"
      }
    ],
    "from": {
      "email": "fernanda.thomazinho@codus.com.br"
    },
    "template_id": "3234e19e-d56b-4298-83c2-8d0b74570322"
  }'
request = Net::HTTP::Post.new(uri)
request.body = data
request.content_type = 'application/json'
request['Authorization'] = 'Bearer ' + ENV['SENDGRID_API_KEY']
response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true ) do |http|
    http.request(request)
end
puts response