require "challenge_task_tracker"

RSpec.describe "task_tracker method" do
  it "fails" do
    expect { task_tracker("") }.to raise_error "Empty string."
  end

  context "#TODO present at start of string" do
    it "returns true" do
      result = task_tracker("#TODO: Buy milk")
      expect(result).to eq true
    end
  end

  context "#TODO present at end of string" do
    it "returns true" do
      result = task_tracker("Clean car #TODO")
      expect(result).to eq true
    end
  end

  context "#TODO is lowercase #todo" do
    it "returns false" do
      result = task_tracker("#todo: Pick up dry cleaning")
      expect(result).to eq false
    end
  end

  context "#TODO not present" do
    it "returns false" do
      result = task_tracker("Text friends")
      expect(result).to eq false
    end
  end

  context "#TODO present by itself" do
    it "returns true" do
      result = task_tracker("#TODO")
      expect(result).to eq true
    end
  end
end
