require 'weather'
require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

let(:airport){Airport.new(:capacity => 6)}
let(:airport){Airport.new}
let(:harrier){Plane.new}
let(:jumbo_jet){Plane.new}
let(:concorde){Plane.new}
let(:millenium_falcon){Plane.new}
let(:enterprise){Plane.new}
let(:sleigh){Plane.new}

let(:planes){Array.new([:harrier, :jumbo_jet, :concorde, :millenium_falcon, :enterprise, :sleigh])}
  
  context 'weather is stormy' do

    xit 'planes cannot land if stormy' do
      expect(lambda { planes.each {|plane| airport.receive(plane)} }).to raise_error(RuntimeError, "Storms ahead, plane not cleared for landing")
    end

    xit 'planes cannot take off if stormy' do
      #if the weather is clear to allow airport to receive planes
      planes.each {|plane| airport.receive(plane)}
      #then the next bit fails. Need something to change in between
      expect(lambda { planes.each {|plane| plane.take_off(airport)} }).to raise_error(RuntimeError, "Storms ahead, plane not cleared for takeoff")
    end

  end

  context 'weather is clear' do
   
    xit 'all planes can land in clear weather' do
      expect(lambda { planes.each {|plane| airport.receive(plane)} }).to change{airport.plane_count}.from(0).to(6)
    end

    it 'landed planes must have status "landed"' do
      harrier.take_off(airport)
      expect{harrier.land(airport)}.to change{harrier.flying?}.to (false)
    end

    xit 'all planes can take off in clear weather' do
    
      planes.each {|plane| airport.receive(plane)}
      expect(lambda { planes.each {|plane| plane.take_off(airport)} }).to change{airport.plane_count}.from(6).to(0)

    end

    xit 'flying planes must have status "flying"' do
      expect{harrier.take_off(airport)}.to change{harrier.flying?}.to (true)
    end

  end

end