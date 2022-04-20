require 'card'

class StraightFlush
    
    VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q','K', 'A']

    def straight_flush?(hand)
        cards = hand.split.map { |c| Card.new(c) }
        return same_suit_for_all_cards?(cards) && consecutive_values?(cards)
    end

    def the_winner_is(hand1, hand2)
        cards1 = hand1.split.map { |c| Card.new(c) }
        cards2 = hand2.split.map { |c| Card.new(c) }
        max_card1 = max?(cards1)
        max_card2 = max?(cards2)
        max = max?([max_card1, max_card2])
        if max == max_card1
            return hand1   
        elsif (max == max_card2)
            return hand2
        else 
            return nil
        end
    end

    def max?(cards)    
        if cards.map { |c| c.score}.uniq.size == 1   # same score
            return nil
        end

        max_score = cards[0].score
        max_card = cards[0]
        cards.each do |c|
            if (c.score > max_score)
                max_score = c.score
                max_card = c
            end
        end
        max_card
    end

    def same_suit_for_all_cards?(cards)
        suits = cards.map { |card| card.suit }
        return all_equal?(suits)
    end

    def consecutive_values?(cards)
        values = cards.map { |card| card.value }
        first_value = values[0]
        index = StraightFlush::VALUES.index(first_value)
        comparison = values.collect do |v|
            same_value = StraightFlush::VALUES[index] == v 
            if (index +1 == StraightFlush::VALUES.size) 
                index = 0
            else
                index += 1
            end
            same_value 
        end
        return comparison.uniq == [true]
    end

    def all_equal?(arr)
        arr.uniq.size <= 1
    end
end