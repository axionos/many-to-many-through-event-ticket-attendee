class Attendee
  attr_reader :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def events
    Ticket.all.select do |t|
      t.attendee == self
    end
  end

  def money_spent
    self.events.map do |e|
      e.event.ticket_price
    end.sum
  end

  def self.all
    @@all
  end
end

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
