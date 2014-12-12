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
    raise "Storms ahead, plane not cleared for landing" unless clear_weather?
    planes << plane
    plane.land
  end

  def request_takeoff(plane) 
    raise "Storms ahead, plane not cleared for takeoff" unless clear_weather?
    plane.take_off
    planes.delete(plane)
  end 
  
  def clear_weather?
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