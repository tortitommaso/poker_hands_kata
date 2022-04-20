require 'straight_flush'

RSpec.describe Card  do
  
    it 'score' do
        expect(Card.new("2C").score).to be 2
        expect(Card.new("TC").score).to be 10
        expect(Card.new("JC").score).to be 11
        expect(Card.new("QC").score).to be 12
        expect(Card.new("KC").score).to be 13
        expect(Card.new("AC").score).to be 14
    end

end  