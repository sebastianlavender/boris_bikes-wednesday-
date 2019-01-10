require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("No bikes available") unless empty?
    @bikes.pop
  end

  def dock(bike)
    fail("Docking station full") if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.length >= 1
  end
end
