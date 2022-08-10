require "grammar"

RSpec.describe "check_grammar method" do
  context "given an empty string" do
    it "fails" do
      expect { check_grammar("") }.to raise_error "Not a sentence."
    end
  end

  context "given sentence with capital letter and full stop." do
    it "returns true" do
      result = check_grammar("Hi, I'm Phil.")
      expect(result).to eq true
    end
  end

  context "given sentence without capital letter." do
    it "returns false" do
      result = check_grammar("hi, I'm Phil.")
      expect(result).to eq false
    end
  end

  context "given sentence without full-stop." do
    it "returns false" do
      result = check_grammar("Hi, I'm Phil")
      expect(result).to eq false
    end
  end

  context "given sentence without capital letterr or full-stop." do
    it "returns false" do
      result = check_grammar("hi, I'm Phil")
      expect(result).to eq false
    end
  end

  context "given correct sentence with exclamation mark at end." do
    it "returns true" do
      result = check_grammar("Hi, I'm Phil!")
      expect(result).to eq true
    end
  end
end
