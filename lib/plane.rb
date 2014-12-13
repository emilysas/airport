require_relative 'airport'

class Plane

  def initialize(options={})
    @flying = false
  end

  def flying?
    @flying
  end

  def take_off(airport)
    airport.request_takeoff(self)
    @flying = true
    puts "flying"
  end

  def land(airport)
    airport.receive(self)
    @flying = false
    puts "landed"
  end

end