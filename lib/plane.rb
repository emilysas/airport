require_relative 'airport'

class Plane

  def initialize
    landed
  end

  def flying?
    @flying
  end

  def flying
    @flying = true
  end

  def landed
    @flying = false
  end

  def take_off!(airport)
    airport.request_takeoff(self)
    flying
  end

  def land!(airport)
    airport.receive(self)
    landed
  end

end