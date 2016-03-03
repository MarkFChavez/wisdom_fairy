require "uri"
require "net/http"
require "json"
require "twilio-ruby"

require_relative "credentials"
require_relative "quote"
require_relative "wisdom_fairy"

puts "Getting Quote of the Day..."

quotes = [
  "\"Whenever you find yourself on the side of the majority, it is time to reform (or pause and reflect).\" - Mark Twain",
  "\"Anyone who thinks sitting in church can make you a Christian must also think that sitting in a garage can make you a car.\" - Garrison Keillor",
  "\"It is impossible to live without failing at something, unless you live so cautiously that you might as well not have lived at all - in which case, you fail by default.\" - J.K. Rowling"
]

quote = "#{WisdomFairy.get!}" rescue quotes.sample

@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

begin
  @client.messages.create(
    from: TWILIO_NUMBER,
    to: RECIPIENTS,
    body: quote
  )
rescue Twilio::REST::RequestError => e
  puts e.message
end
