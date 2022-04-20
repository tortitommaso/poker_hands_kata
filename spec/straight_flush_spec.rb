require 'straight_flush'

RSpec.describe StraightFlush  do
  
    let(:straight_flush) { StraightFlush.new }

    it 'straight flush' do
        expect(straight_flush.straight_flush?("8C 9C TC JC QC")).to be true
        expect(straight_flush.straight_flush?("AC 2C 3C 4C 5C")).to be true
        expect(straight_flush.straight_flush?("7C 9C TC JC QC")).to be false
    end

    it 'consecutive values' do
        cards = [Card.new("2C"), Card.new("3C")]
        expect(straight_flush.consecutive_values?(cards)).to be true

        cards = [Card.new("AC"), Card.new("2C")]
        expect(straight_flush.consecutive_values?(cards)).to be true

        cards = [Card.new("2C"), Card.new("4C")]
        expect(straight_flush.consecutive_values?(cards)).to be false
    end

    it 'comparison' do
        hand1 = "9C TC JC QC KC"
        hand2 = "8C 9C TC JC QC"
        hand3 = "1S 2S 3S 4S 5S"
        expect(straight_flush.the_winner_is(hand1, hand2)).to be hand1
        expect(straight_flush.the_winner_is(hand1, hand3)).to be hand1
        expect(straight_flush.the_winner_is(hand2, hand3)).to be hand2
        
        expect(straight_flush.the_winner_is(hand3, hand3)).to be nil
    end

    it "max value" do
        card1 = Card.new("2C")
        card2 = Card.new("3C")
        card3 = Card.new("AC")
        expect(straight_flush.max?([card1, card2])).to be card2
        expect(straight_flush.max?([card1, card3])).to be card3
        expect(straight_flush.max?([card2, card3])).to be card3
        expect(straight_flush.max?([card1, card2, card3])).to be card3

        expect(straight_flush.max?([card1, card1])).to be nil
    end


end  