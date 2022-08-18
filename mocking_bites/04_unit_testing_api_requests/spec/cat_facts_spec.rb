require "cat_facts"

RSpec.describe CatFacts do
  it "gets a random cat fact" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://catfact.ninja/fact")
    ).and_return(
      '{"fact":"A cat rubs against people not only to be affectionate but also to mark out its territory with scent glands around its face. The tail area and paws also carry the cat\u2019s scent.","length":174}'
    )
    cat_facts = CatFacts.new(fake_requester)
    expect(
      cat_facts.provide
    ).to eq "Cat fact: A cat rubs against people not only to be affectionate but also to mark out its territory with scent glands around its face. The tail area and paws also carry the cat’s scent."
  end
end
