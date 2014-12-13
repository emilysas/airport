require_relative 'airport'
require_relative 'plane'

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Check number of planes in airport"
  puts "2. Request take off"
  puts "3. Receive plane"
  puts "4. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "There are #{@airport.plane_count} planes at the airport"
    when "2"
      select_plane
      # this doesn't work - I think it's because the message from @plane doesn't go to the actual plane object
      @plane.flying? ? "This plane is already in the air" : @plane.take_off(@airport)
    when "3"
      select_plane
      @plane.flying? ? @plane.take_off(@airport) : "This plane is not currently flying"
      @plane.land(@airport)
    when "4"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def select_plane
  planes = ["Harrier", "Concorde", "Jumbo"]
  puts "Please select from the follow planes: #{planes.to_s}"
  answer = STDIN.gets.chomp
  plane = '@'+answer.downcase
  @plane = instance_variable_get(plane)
end

@harrier = Plane.new
@concorde = Plane.new
@jumbo = Plane.new

@airport = Airport.new
interactive_menu

#need a way to keep track of planes
#need a way to make sure you can't land a plane twice(without it flying in between)
#need to work out how to check for storms
#and then prevent the result of rand from changing