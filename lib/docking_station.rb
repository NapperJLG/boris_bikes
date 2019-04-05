require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("No bikes available") if empty? == true
    @bikes[0]
    @bikes.delete_at(0)

  end

  def dock(bike)
    fail("No space available") if full? == true
    @bikes << bike
  end

private
 def full?
   @bikes.count >= DEFAULT_CAPACITY ? true : false
 end

 def empty?
   @bikes.count == 0 ? true : false
 end


end
