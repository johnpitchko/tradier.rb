require 'spec_helper'

describe Tradier::Quote do

  describe "#==" do
    it "returns true when objects symbols are the same" do
      quote = Tradier::Quote.new({ :symbol => 'AAPL' })
      other = Tradier::Quote.new({ :symbol => 'AAPL' })
      expect(quote == other).to be_truthy
    end
    it "returns false when objects IDs are different" do
      quote = Tradier::Quote.new({ :symbol => 'AAPL' })
      other = Tradier::Quote.new({ :symbol => 'GE' })
      expect(quote == other).to be_falsey
    end
  end

  describe "#symbol" do
    it "returns the symbol when set" do
      quote = Tradier::Quote.new({ :symbol => 'AAPL' })
      expect(quote.symbol).to eq('AAPL')
    end
    it "returns nil when symbol is not set" do
      quote = Tradier::Quote.new('Quote' => {})
      expect(quote.symbol).to be_nil
    end
  end

end
