# require './mailer.rb'
require './person.rb'
require './assignment.rb'
require './texter.rb'

texter = Texter.new()

peopleList = [
    Person.new('Ben', 0, '+18658043274', true, true),
    Person.new('Emily', 0, '+12703048369', true, true),
    Person.new('Becca', 1, '+13143699128', true, true),
    Person.new('Phil', 1, '+17158084403', true, true),
    Person.new('Abby', 2, '+16364435345', true, true),
    Person.new('Bion', 2, '+12145426078', true, true),
    Person.new('Brad', 3, '+15028552869', false, true),
    Person.new('Sandy', 3, '+12703047596', false, true)
]

def createStockingAssignments(peopleList)
    stockingPeople = peopleList.select { |p| p.is_in_stocking }
    stockingGivers = stockingPeople.shuffle
    stockingReceivers = stockingPeople.shuffle
    
    for i in 0..stockingGivers.count - 1
        giver = stockingGivers[i]
        receiver = stockingReceivers.find { |p| p.name != giver.name && p.group != giver.group }
    
        return false if receiver == nil
    
        stockingReceivers.delete(receiver)
        giver.stocking = receiver.name
    end

    return true
end

def createGiftAssignments(peopleList)
    giftPeople = peopleList.select { |p| p.is_in_gifting }
    giftGivers = giftPeople.shuffle
    giftReceivers = giftPeople.shuffle

    for i in 0..giftGivers.count - 1
        giver = giftGivers[i]
        receiver = giftReceivers.find { |p| p.name != giver.name && p.group != giver.group && p.name != giver.stocking }
    
        return false if receiver == nil
    
        giftReceivers.delete(receiver)
        giver.gift = receiver.name
    end

    return true
end


### Begin Program ###

done = false
stockingIterations = 0
giftIterations = 0

while !done do
    done = createStockingAssignments(peopleList)
    stockingIterations += 1
end

done = false

while !done do
    done = createGiftAssignments(peopleList)
    giftIterations += 1
end

peopleList.each do |p| 
    texter.send_text(p)
end
