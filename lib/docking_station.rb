require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("No bikes available") unless @bikes.count > 0
    @bikes[0]
    @bikes.delete_at(0)

  end

  def dock(bike)
    fail("No space available") if @bikes.count > 19
    @bikes << bike
  end


end
