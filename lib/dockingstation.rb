require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise RuntimeError, "There are no bikes" if empty?
    working_bikes = []
    @bikes.each_with_index {|bike, i| working_bikes << i unless bike.broken? }
    raise RuntimeError, "There are no working bikes" if working_bikes.count == 0
   output = @bikes.fetch(working_bikes[0])
   @bikes.delete_at(working_bikes[0])
    return output
  end

  def dock(bike)
    raise RuntimeError, "Docking station is full" if full?
    @bikes << bike
  end

  def return_bike(bike)
    raise RuntimeError, "All bike are return" if full?
    @bikes << bike

  end

  private
#
  def full?
    @bikes.count >= @capacity ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end
