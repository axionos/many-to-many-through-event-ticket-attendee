require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 22)
tom = Attendee.new("Tom", 30)

concert = Event.new("concert", 10000, 100)
football = Event.new("football bame", 10000, 50)

ticket1 = Ticket.new(concert, lucy)
ticket2 = Ticket.new(football, lucy)
ticket3 = Ticket.new(concert, tom)

#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
