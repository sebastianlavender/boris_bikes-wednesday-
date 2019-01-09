require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bike = nil
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end
end
