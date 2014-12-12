class Airport 

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
    planes << plane
    plane.land
  end

  def request_takeoff(plane)
    plane.take_off
  end 

  def full?
    plane_count == capacity
  end

  def plane_count
    planes.count
  end


end