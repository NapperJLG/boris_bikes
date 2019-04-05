require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("No bikes available") if self.empty? == true
    @bikes[0]
    @bikes.delete_at(0)

  end

  def dock(bike)
    fail("No space available") if self.full? == true
    @bikes << bike
  end
  
private
 def full?
   @bikes.count > 19 ? true : false
 end

 def empty?
   @bikes.count == 0 ? true : false
 end


end
