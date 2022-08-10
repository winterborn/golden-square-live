require "gratitudes"

RSpec.describe Gratitudes do
  it do
    gratitudes = Gratitudes.new
    gratitudes.add("my dog")
    gratitudes.add("my friends")
    expect(gratitudes.format).to eq "Be grateful for: my dog, my friends"
  end
end
