require "json"

class StarWarsQuote
  def initialize(request)
    @request = request
  end

  def provide
    return "#{get_sw_quote["opening_crawl"]}"
  end

  private

  def get_sw_quote
    text_response = @request.get(URI("https://swapi.dev/api/films/6/"))
    return JSON.parse(text_response)
  end
end

# Run:
# require "net/http"
# star_wars_quote = StarWarsQuote.new(Net::HTTP)
# p star_wars_quote.provide
