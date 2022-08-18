require "dog_facts"

RSpec.describe DogFacts do
  it "gives a random dog fact" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://dog-api.kinduff.com/api/facts")
    ).and_return(
      '{"facts":["Search and Rescue dog training begin as games played while puppies."],"success":true}'
    )
    dog_facts = DogFacts.new(fake_requester)
    expect(
      dog_facts.provide
    ).to eq "Random Dog Fact: Search and Rescue dog training begin as games played while puppies."
  end
end
