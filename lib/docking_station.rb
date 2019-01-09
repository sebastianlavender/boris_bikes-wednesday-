require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("No bikes available") unless @bikes.length >= 1
    @bikes[0]
  end

  def dock(bike)
    fail("Docking station full") if @bikes.length >= 20
    @bikes << bike
  end
end
