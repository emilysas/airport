require 'weather'
require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

let(:airport){Airport.new(:capacity => 6)}
let(:plane){Plane.new}
let(:planes){6.times.collect{Plane.new}}

  context 'weather is stormy' do

    before {allow(airport).to receive(:clear?).and_return(false)}   
      it 'planes cannot land if stormy' do
        expect(lambda { planes.each {|plane| airport.receive(plane)} }).to raise_error("Stormy")
      end

      it 'planes cannot take off if stormy' do
        expect(lambda { planes.each {|plane| plane.take_off!(airport)} }).to raise_error("Stormy")
      end

  end

  context 'weather is clear' do
   
    before {allow(airport).to receive(:clear?).and_return(true)}

      it 'all planes can land in clear weather' do
        expect(lambda { planes.each {|plane| airport.receive(plane)} }).to change{airport.plane_count}.from(0).to(6)
      end

      it 'landed planes must have status "landed"' do
        plane.take_off!(airport)
        expect{plane.land!(airport)}.to change{plane.flying?}.to(false)
      end

      it 'all planes can take off in clear weather' do 
        planes.each {|plane| airport.receive(plane)}
        expect(lambda { planes.each {|plane| plane.take_off!(airport)} }).to change{airport.plane_count}.from(6).to(0)

      end

      it 'flying planes must have status "flying"' do
        plane.land!(airport)
        expect{plane.take_off!(airport)}.to change{plane.flying?}.to(true)
      end

  end

end