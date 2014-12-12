require 'weather'

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
    raise "Plane cannot land, the airport is full" if full?
    raise "Storms ahead, plane not clear for landing" unless clear_for_takeoff?
    planes << plane
    plane.land
  end

  def request_takeoff(plane) 
    raise "Storms ahead, plane not clear for takeoff" unless clear_for_takeoff?
    plane.take_off
    planes.delete(plane)
  end 
  
  def clear_for_takeoff?
    playing_god
    @stormy ? false : true
  end

  def full?
    plane_count == capacity
  end

  def plane_count
    planes.count
  end


end