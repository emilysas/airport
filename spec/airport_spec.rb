require 'airport'

describe Airport do
  let(:airport) {Airport.new(:capacity => 50)}
  let(:plane) {double :plane, airport: airport}
  
  context 'taking off and landing' do
    before {allow(airport).to receive(:playing_god){@stormy = false}}

    it 'a plane can land' do
      expect{airport.receive(plane)}.to change{airport.plane_count}.by(1)
    end

    it 'a plane can take off' do
      airport.receive(plane)
      expect{airport.request_takeoff(plane)}.to change{airport.plane_count}.by(-1)
    end

  end

  context 'traffic control' do
    before {allow(airport).to receive(:playing_god){@stormy = false}}

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:land)
      expect{51.times{airport.receive(plane)}}.to raise_error(RuntimeError, "Plane cannot land, the airport is full")
    end
  end


  context 'weather conditions' do

    before {allow(airport).to receive(:playing_god){@stormy = true}}

      xit 'a plane cannot take off when there is a storm brewing' do
        airport.receive(plane)
        expect(airport.clear_weather?).to be(false)
        
      end

      xit 'a plane cannot land in the middle of a storm' do
        expect{ airport.receive(plane) }.not_to change{airport.plane_count}
      end 
    
  end
end
