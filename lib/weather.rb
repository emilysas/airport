module Weather

  def playing_god
    weather = Random.new
    forcast = weather.rand(10)
    forcast <= 2 ? @stormy = true : @stormy = false
  end

end