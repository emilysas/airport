require 'weather'
# Include a weather condition using a module.
# The weather must be random and only have two states "sunny" or "stormy".
# Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
#
# This will require stubbing to stop the random return of the weather.
# If the airport has a weather condition of stormy,
# the plane can not land, and must not be in the airport
describe Weather do

  let(:plane){double :plane}
  let(:airport){double :airport}

  context 'weather conditions' do

    before {allow(airport).to receive(:playing_god){@stormy = true}}

      it 'a plane cannot take off when there is a storm brewing' do
        allow(plane).to receive(:take_off)
        allow(airport).to receive(:request_takeoff).with(plane)
        @stormy = true
        expect{airport.request_takeoff(plane)}.to raise_error(RuntimeError, "Storms ahead, plane not clear for takeoff")
      end

      xit 'a plane cannot land in the middle of a storm' do
       
      end

    
  end
end