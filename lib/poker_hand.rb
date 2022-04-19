require 'card'

class PokerHand
    
    VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q','K', 'A']

    def straight_flush?(hand)
        cards = hand.split.map { |c| Card.new(c) }
        return same_suit_for_all_cards?(cards) && consecutive_values?(cards)
    end

    def same_suit_for_all_cards?(cards)
        suits = cards.map { |card| card.suit }
        return all_equal?(suits)
    end

    def consecutive_values?(cards)
        values = cards.map { |card| card.value }
        first_value = values[0]
        index = PokerHand::VALUES.index(first_value)
        comparison = values.collect do |v|
            index += 1 
            PokerHand::VALUES[index] == v 
        end
        return comparison.uniq.size == 1
    end

    def all_equal?(arr)
        arr.uniq.size <= 1
    end
end