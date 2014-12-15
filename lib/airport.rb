require_relative 'plane'
require_relative 'weather'

class Airport 

  include Weather

  attr_writer :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def capacity
    @capacity ||= 50
  end

  def planes
    @planes ||= []
  end

  def receive(plane)
      raise "Full" if full?
      stormy
      planes << plane
  end

  def permit_takeoff(plane)
    stormy
    planes.delete(plane)
  end

  def stormy
    raise "Stormy" unless clear?
  end

  def full?
    plane_count >= capacity
  end

  def plane_count
    planes.count
  end

end
