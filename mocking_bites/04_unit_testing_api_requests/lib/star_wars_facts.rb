require "json"
require "net/http"

class StarWarsQuote
  def provide
    return "Star Wars Quote: #{get_sw_quote["content"]}"
  end

  private

  def get_sw_quote
    text_response =
      Net::HTTP.get(
        "http://swquotesapi.digitaljedi.dk/api/SWQuote/RandomStarWarsQuote#"
      )
    return JSON.parse(text_response)
  end
end

# Run:
star_wars_quote = StarWarsQuote.new
p star_wars_quote.provide
