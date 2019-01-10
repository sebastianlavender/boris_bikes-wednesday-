require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
      fail("No bikes available") unless empty?
      fail("No working bikes available") unless working?
      bikes.pop
  end

  def dock(bike)
    fail("Docking station full") if full?
    bikes << bike
  end

  private

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.length >= 1
  end

  def working?
    bikes.last.working
  end

end

# DEFAULT_CAPACITY
# to complete this challenge, you will need to:
#  Define a constant, DEFAULT_CAPACITY, that stores the number 20. Do this within the DockingStation class.
#  Remove references to the magic number 20 in your implementation, using DEFAULT_CAPACITY instead.
#  Refactor your tests to use this new constant instead of the magic number 20.
