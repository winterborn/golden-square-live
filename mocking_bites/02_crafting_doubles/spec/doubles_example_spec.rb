RSpec.describe "example" do
  it "example 1" do
    fake = double :fake
    expect(fake).to receive(:greet).with("Phil", "Kat").and_return("Hi!")
    expect(fake.greet("Phil", "Kat")).to eq "Hi!"
  end
end
