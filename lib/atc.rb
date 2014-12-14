require_relative 'airport'
require_relative 'plane'


@harrier = Plane.new
@concorde = Plane.new
@jumbo = Plane.new
@enterprise = Plane.new
@millenium_falcon = Plane.new
@jet = Plane.new
@airport = Airport.new


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
      airport_clear_for_takeoff(@choice)
    when "3"
      select_plane
      airport_receive(@choice)
    when "4"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def select_plane  
  puts "Please select from the follow planes: Harrier, Concorde, Jumbo, Jet, Millenium Falcon, Enterprise"
  which_plane(STDIN.gets.chomp)
end

def which_plane(selection)
  @choice = case selection
            when "Harrier"
              @harrier
            when "Concorde"
              @concorde
            when "Jumbo"
              @jumbo
            when "Jet"
              @jet
            when "Millenium Falcon"
              @millenium_falcon
            when "Enterprise"
              @enterprise
            else 
              "We're unaware of a plane of that name"
          end
end

def airport_clear_for_takeoff(plane)
  plane.flying? ? "This plane is already in the air" : plane.take_off!(@airport)
end

def airport_receive(plane)
  plane.flying? ? plane.land!(@airport) : "This plane is not currently flying"
end

interactive_menu