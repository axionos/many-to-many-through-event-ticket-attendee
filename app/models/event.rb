class Event
  attr_reader :name, :total_cost, :ticket_price

  @@all = []
  def initialize(name, total_cost, ticket_price)
    @name = name
    @total_cost = total_cost
    @ticket_price = ticket_price
    @@all << self
  end

  def attendees
    Ticket.all.select do |t|
      t.event == self
    end
  end

  def sell_to_break_even
    total_earning = self.attendees.map do |p|
      p.event.ticket_price
    end.sum
    # binding.pry
    break_even = (@total_cost - total_earning) / @ticket_price
    break_even
  end

  def average_age
    ages = self.attendees.map do |a|
      a.attendee.age
    end
    ages.sum / ages.size
  end

  def self.all
    @@all
  end
end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0.
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
