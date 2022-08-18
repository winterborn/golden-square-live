require "activity_suggester"

RSpec.describe ActivitySuggester do
  it "suggests an activity" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      "www.boredapi.com",
      "/api/activity"
    ).and_return(
      '{"activity":"Play a game of Monopoly","type":"social","participants":4,"price":0.2,"link":"","key":"1408058","accessibility":0.3}'
    )
    activity_suggester = ActivitySuggester.new(fake_requester)
    expect(activity_suggester.suggest).to eq "Why not: Play a game of Monopoly"
  end
end
