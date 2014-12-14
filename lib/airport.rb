require_relative 'plane'
require_relative 'weather'

class Airport 

  include Weather

  attr_writer :capacity, :clear_weather

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    self.clear_weather = options.fetch(:clear_weather, clear_weather)
  end

  def capacity
    @capacity ||= 50
  end

  def planes
    @planes ||= []
  end

  def clear_weather
    @clear_weather ||= true
  end

  def receive(plane)
    if full? 
      full_error("land")
    elsif clear? == false
      stormy_error("takeoff")  
    else
      puts "Cleared for landing"
      @planes << plane
      puts "Landed"
    end
  end

  def request_takeoff(plane) 
    if clear? == false
      stormy_error("takeoff") 
    else
      puts "Cleared for takeoff"
      planes.delete(plane)
      puts "Flying"
    end
  end

  def full_error(request)
      begin
        raise RuntimeError
      rescue
        puts "Plane cannot land, the airport is full. Please await further instruction"
      end
  end

  def stormy_error(request)
      begin
        raise RuntimeError
      rescue
        puts "Storms ahead, plane not cleared for #{request}. Please wait for the storms to pass"
      end
  end

  def clear?
    playing_god
    @stormy ? @clear_weather = false : @clear_weather = true
  end

  def full?
    plane_count == capacity
  end

  def plane_count
    planes.count
  end


end