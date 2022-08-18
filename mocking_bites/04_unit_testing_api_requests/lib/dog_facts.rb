require "json"
require "net/http"

class DogFacts
  def initialize(requester)
    @requester = requester
  end
  def provide
    return "Random Dog Fact: #{get_dog_fact["facts"][0]}"
  end

  private

  def get_dog_fact
    text_response = @requester.get(URI("https://dog-api.kinduff.com/api/facts"))
    return JSON.parse(text_response)
  end
end

# Run:
# require "net/http"
# dog_facts = DogFacts.new(Net::HTTP)
# p dog_facts.provide
