require "uri"
require "net/http"
require "json"
require "twilio-ruby"

require_relative "credentials"
require_relative "quote"
require_relative "wisdom_fairy"

puts "Getting Quote of the Day..."

@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

begin
  @client.messages.create(
    from: TWILIO_NUMBER,
    to: RECIPIENTS,
    body: QUOTE_OF_THE_DAY
  )
rescue Twilio::REST::RequestError => e
  puts e.message
end
