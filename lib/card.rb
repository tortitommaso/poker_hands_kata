class Card

    def initialize code
        @code = code
    end

    def suit
        @code[1]
    end

    def value
        @code[0]
    end

    def score
        case self.value
        when 'T' then 10
        when 'J' then 11
        when 'Q' then 12
        when 'K' then 13
        when 'A' then 14
        else self.value.to_i
        end
    end

    def to_s
        @code
    end
end