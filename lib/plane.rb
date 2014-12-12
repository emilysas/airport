class Plane

  def initialize(options={})
    land
  end

  def flying?
    @flying
  end

  def take_off from: airport
    @flying = true
  end

  def land
    @flying = false
  end

end