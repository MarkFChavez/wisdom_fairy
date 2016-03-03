require "uri"
require "net/http"
require "json"

require_relative "wisdom_fairy"
require_relative "quote"

puts WisdomFairy.get!
