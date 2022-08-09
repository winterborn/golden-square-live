require "present"

RSpec.describe Present do
  it " wraps and unwraps a value" do
    present = Present.new
    present.wrap("xbox")
    expect(present.unwrap).to eq "xbox"
  end

  it "fails if we unwrap without wrapping first" do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end

  it "fails if we wrap if already wrapped" do
    present = Present.new
    present.wrap("xbox")
    expect {
      present.wrap("playstation")
    }.to raise_error "A contents has already been wrapped."
  end
end
