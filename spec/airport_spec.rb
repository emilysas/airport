require 'airport'

describe Airport do
  let(:airport) {Airport.new(:capacity => 50)}
  let(:plane) {double :plane, airport: airport}
  
  context 'taking off and landing' do
    before {allow(airport).to receive(:playing_god){@stormy = false}}

    xit 'a plane can land' do
      expect{airport.receive(plane)}.to change{airport.plane_count}.by(1)
    end

    xit 'a plane can take off' do
      airport.receive(plane)
      expect{airport.request_takeoff(plane)}.to change{airport.plane_count}.by(-1)
    end

  end

  context 'traffic control' do
    before {allow(airport).to receive(:playing_god){@stormy = false}}

    xit 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:land!).with(airport)
      expect{51.times{airport.receive(plane)}}.to raise_error(RuntimeError, "Plane cannot land, the airport is full")
    end
  end


  context 'weather conditions' do

      xit 'a plane cannot take off when there is a storm brewing' do
        airport.plane_count{planes.count = 1}
        airport.clear_weather?{false}
        expect{ airport.request_takeoff(plane) }.to raise_error(RuntimeError, "Storms ahead, plane not cleared for takeoff")
      end

      xit 'a plane cannot land in the middle of a storm' do
        airport.clear_weather?{false}
        expect{ airport.receive(plane) }.to raise_error(RuntimeError, "Storms ahead, plane not cleared for landing")
      end 
    
  end
end
