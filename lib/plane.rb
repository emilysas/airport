require_relative 'airport'

class Plane

  def initialize(options={})
    @flying = false
  end

  def flying?
    @flying
    puts "landed" unless @flying == true
  end

  def take_off(airport)
    airport.request_takeoff(self)
    @flying = true
  end

  def land(airport)
    airport.receive(self)
    @flying = false
  end

end