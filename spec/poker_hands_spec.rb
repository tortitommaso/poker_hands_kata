require 'poker_hand'
RSpec.describe PokerHand  do
  
    it 'straight_flush' do
        pokerHand = PokerHand.new
        expect(pokerHand.straight_flush?("8C 9C TC JC QC")).to be true
        expect(pokerHand.straight_flush?("AC 2C 3C 4C 5C")).to be true
        expect(pokerHand.straight_flush?("7C 9C TC JC QC")).to be false
    end
end  