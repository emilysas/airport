module Weather

  def playing_god
    weather = Random.new
    forecast = weather.rand(10)
    forecast <= 2 ? @stormy = true : @stormy = false
  end

end