require 'weather'
require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

let(:stormy_airport){Airport.new(:capacity => 6, :clear_weather => false)}
let(:sunny_airport){Airport.new(:capacity => 6)}
let(:harrier){Plane.new}
let(:jumbo_jet){Plane.new}
let(:concorde){Plane.new}
let(:millenium_falcon){Plane.new}
let(:enterprise){Plane.new}
let(:sleigh){Plane.new}

let(:planes){Array.new([harrier, jumbo_jet, concorde, millenium_falcon, enterprise, sleigh])}
  
  context 'weather is stormy' do

    before {allow(stormy_airport).to receive(:clear_for_takeoff?){@clear_weather = false}}
      
      it 'planes cannot land if stormy' do
        expect(lambda { planes.each {|plane| stormy_airport.receive(plane)} }).not_to change{stormy_airport.plane_count}
      end

      it 'planes cannot take off if stormy' do
        expect(lambda { planes.each {|plane| plane.take_off!(stormy_airport)} }).not_to change{stormy_airport.plane_count}
      end

  end

  context 'weather is clear' do
   
    before {allow(sunny_airport).to receive(:playing_god){@stormy = false}}

      it 'all planes can land in clear weather' do

        expect(lambda { planes.each {|plane| sunny_airport.receive(plane)} }).to change{sunny_airport.plane_count}.from(0).to(6)
      end

      it 'landed planes must have status "landed"' do
        harrier.take_off!(sunny_airport)
        expect{harrier.land!(sunny_airport)}.to change{harrier.flying?}.to (false)
      end

      it 'all planes can take off in clear weather' do
      
        planes.each {|plane| sunny_airport.receive(plane)}
        expect(lambda { planes.each {|plane| plane.take_off!(sunny_airport)} }).to change{sunny_airport.plane_count}.from(6).to(0)

      end

      it 'flying planes must have status "flying"' do
        expect{harrier.take_off!(sunny_airport)}.to change{harrier.flying?}.to (true)
      end

  end

end