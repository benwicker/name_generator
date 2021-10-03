require 'twilio-ruby'

class Texter
    def initialize
        account_sid = 'AC67ba4e31e3d0e0b05223a1b3c2659517'
        auth_token = '8fb84fa27baad60099e8fb972ca327fa'
        @client = Twilio::REST::Client.new(account_sid, auth_token) 
        @from = '+12565488845'
    end

    def send_text(person)
        body = "Here's your Genet family Christmas stocking/gift exchange assignment \n"
        body += "Stuff a stocking for: #{person.stocking}"

        if person.is_in_gifting
            body += "\nGet a gift for #{person.gift}"
        end

        @client.messages.create(
            from: @from,
            to: person.number,
            body: body
            )
    end
end
