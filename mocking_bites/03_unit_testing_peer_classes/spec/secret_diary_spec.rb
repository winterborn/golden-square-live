require "secret_diary"

RSpec.describe SecretDiary do
  context "#lock" do
    it "locks the diary" do
      diary = double(:diary, read: "Wednesday afternoon it rained in London.")
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.lock).to eq true
    end
  end

  context "#unlock" do
    it "unlocks the diary" do
      diary = double(:diary, read: "hello!!")
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.unlock).to eq false
    end
  end

  context "#read" do
    it "fails if diary is locked" do
      diary = double(:diary, read: "Wednesday afternoon it rained in London.")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  it "read will return diary's contents if unlocked" do
    diary = double(:diary, read: "Wednesday afternoon it rained in London.")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Wednesday afternoon it rained in London."
  end
end
