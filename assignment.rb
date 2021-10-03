class Assignment
    attr_accessor :giver
    attr_accessor :receiver

    def initialize (giver, receiver)
        @giver = giver
        @receiver = receiver
    end
end