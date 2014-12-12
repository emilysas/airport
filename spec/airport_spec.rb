require 'airport'

# A plane currently in the airport can be requested to take off.

describe Airport do
  let(:airport) {Airport.new(:capacity => 50)}
  let(:plane) {double :plane}
  
  context 'taking off and landing' do

    it 'a plane can land' do
      expect(plane).to receive(:land)
      airport.receive(plane)
    end

    it 'a plane can take off' do
      expect(plane).to receive(:take_off)
      airport.request_takeoff(plane)
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
          allow(plane).to receive(:land)
          expect{51.times{airport.receive(plane)}}.to raise_error(RuntimeError, "Plane cannot land, the airport is full")
    end

  
# Include a weather condition using a module.
# The weather must be random and only have two states "sunny" or "stormy".
# Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
#
# This will require stubbing to stop the random return of the weather.
# If the airport has a weather condition of stormy,
# the plane can not land, and must not be in the airport

    context 'weather conditions' do

      xit 'a plane cannot take off when there is a storm brewing' do

      end


      xit 'a plane cannot land in the middle of a storm' do

      end

    end
  end
end
