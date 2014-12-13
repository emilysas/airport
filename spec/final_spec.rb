require 'weather'
require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

let(:stormy_airport){Airport.new(:capacity => 6, :clear_weather => false)}
let(:sunny_airport){Airport.new(:capacity => 6, :clear_weather => true)}
let(:harrier){Plane.new}
let(:jumbo_jet){Plane.new}
let(:concorde){Plane.new}
let(:millenium_falcon){Plane.new}
let(:enterprise){Plane.new}
let(:sleigh){Plane.new}

let(:planes){Array.new([harrier, jumbo_jet, concorde, millenium_falcon, enterprise, sleigh])}
  
  context 'weather is stormy' do

    it 'planes cannot land if stormy' do
      expect(lambda { planes.each {|plane| stormy_airport.receive(plane)} }).to raise_error(RuntimeError, "Storms ahead, plane not cleared for landing")
    end

    it 'planes cannot take off if stormy' do
      
      expect(lambda { planes.each {|plane| plane.take_off!(stormy_airport)} }).to raise_error(RuntimeError, "Storms ahead, plane not cleared for takeoff")
    end

  end

  context 'weather is clear' do
   
    it 'all planes can land in clear weather' do
      expect(lambda { planes.each {|plane| sunny_airport.receive(plane)} }).to change{sunny_airport.plane_count}.from(0).to(6)
    end

    xit 'landed planes must have status "landed"' do
      harrier.take_off!(sunny_airport)
      expect{harrier.land!(sunny_airport)}.to change{harrier.flying?}.to (false)
    end

    xit 'all planes can take off in clear weather' do
    
      planes.each {|plane| sunny_airport.receive(plane)}
      expect(lambda { planes.each {|plane| plane.take_off!(sunny_airport)} }).to change{airport.plane_count}.from(6).to(0)

    end

    xit 'flying planes must have status "flying"' do
      expect{harrier.take_off!(sunny_airport)}.to change{harrier.flying?}.to (true)
    end

  end

end