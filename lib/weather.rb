module Weather

  def weather 
    (1..5).to_a.sample == 1 ? "Stormy" : "Sunny"
  end

  def clear?
    weather != "Stormy"
  end

end