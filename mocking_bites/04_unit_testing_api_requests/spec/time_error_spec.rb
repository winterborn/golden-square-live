require "time_error"

RSpec.describe TimeError do
  it "returns the difference between remote clock and local clock" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return(
      '{"abbreviation":"BST","client_ip":"2a00:23c7:c79c:1f01:759d:8cb3:49a1:dc8e","datetime":"2022-08-18T10:55:07.386099+01:00","day_of_week":4,"day_of_year":230,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1660816507,"utc_datetime":"2022-08-18T09:55:07.386099+00:00","utc_offset":"+01:00","week_number":33}'
    )
    time = Time.new(2022, 8, 18, 10, 55, 07)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq 0.386099
  end
end
