require 'poker_hand'
RSpec.describe PokerHand, '#hello' do
  context 'for a new project' do
    it 'greets the world' do
      pokerHand = PokerHand.new
      expect(pokerHand.hello).to eq 'Hello, world!'
    end
  end
end