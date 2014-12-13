require_relative 'plane'
require_relative 'weather'

class Airport 

  include Weather

  attr_writer :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    self.clear_weather = options.fetch(:clear_weather, true)
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
    @planes << plane
  end

  def request_takeoff(plane) 
    raise "Storms ahead, plane not cleared for takeoff" unless clear_weather?
    planes.delete(plane)
  end 

  def clear_weather
    @clear_weather
  end
  
  def clear_weather?
    playing_god
    @clear_weather = ! @stormy
  end

  def full?
    plane_count == capacity
  end

  def plane_count
    planes.count
  end


end