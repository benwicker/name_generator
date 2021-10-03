class Person 
    attr_accessor :name
    attr_accessor :group
    attr_accessor :number
    attr_accessor :gift
    attr_accessor :stocking
    attr_accessor :is_in_gifting
    attr_accessor :is_in_stocking

    def initialize (name, group, number, is_in_gifting, is_in_stocking)
        @name = name
        @group = group
        @number = number
        @is_in_gifting = is_in_gifting
        @is_in_stocking = is_in_stocking
        @stocking = nil
        @gift = nil
    end
end