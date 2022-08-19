require "star_wars_facts"

RSpec.describe StarWarsQuote do
  it "provides an opening crawl" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://swapi.dev/api/films/6/")
    ).and_return(
      "War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku. There are heroes on both sides. Evil is everywhere. In a stunning move, the fiendish droid leader, General Grievous, has swept into the Republic capital and kidnapped Chancellor Palpatine, leader of the Galactic Senate. As the Separatist Droid Army attempts to flee the besieged capital with their valuable hostage, two Jedi Knights lead a desperate mission to rescue the captive Chancellor...."
    )
    star_wars_quote = StarWarsQuote.new(fake_requester)
    expect(
      star_wars_quote.provide
    ).to eq "War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku. There are heroes on both sides. Evil is everywhere. In a stunning move, the fiendish droid leader, General Grievous, has swept into the Republic capital and kidnapped Chancellor Palpatine, leader of the Galactic Senate. As the Separatist Droid Army attempts to flee the besieged capital with their valuable hostage, two Jedi Knights lead a desperate mission to rescue the captive Chancellor...."
  end
end
