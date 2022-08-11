require "grammar_stats"

RSpec.describe GrammarStats do
  describe "#check" do
    context "given empty string" do
      it "fails" do
        grammar_stats = GrammarStats.new
        expect {
          grammar_stats.check("")
        }.to raise_error "Error, string cannot be empty."
      end
    end

    context "given string with capital letter and full stop" do
      it "returns true" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hi, I'm Phil.")).to eq true
      end
    end

    context "given sentence without capital letter." do
      it "returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("hi, i'm phil.")).to eq false
      end
    end

    context "given sentence without full-stop." do
      it "returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hi, I'm Phil")).to eq false
      end
    end

    context "given sentence without capital letterr or full-stop." do
      it "returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("hi, i'm phil")).to eq false
      end
    end

    context "given correct sentence with exclamation mark at end." do
      it "returns true" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hi, I'm Phil!")).to eq true
      end
    end
  end

  describe "#percentage_good" do
    context "returns an integer of the % of texts that pass the 'check' method." do
      it "returns an integer" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hi, I'm Phil.")
        grammar_stats.check("Hi, I'm Phil!")
        grammar_stats.check("hi, i'm phil")
        grammar_stats.check("Hi, I'm Phil")
        grammar_stats.check("hi, i'm phil.")
        expect(grammar_stats.percentage_good).to eq 40
      end
    end
  end
end
