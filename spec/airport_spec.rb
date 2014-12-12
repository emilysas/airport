require 'airport'

describe Airport do
  let(:airport) {Airport.new(:capacity => 50)}
  let(:plane) {double :plane}
  
  context 'taking off and landing' do

    before {allow(airport).to receive(:playing_god){@stormy = true}}

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
    before {allow(airport).to receive(:playing_god){@stormy = true}}

    it 'a plane cannot land if the airport is full' do
      allow(plane).to receive(:land)
      expect{51.times{airport.receive(plane)}}.to raise_error(RuntimeError, "Plane cannot land, the airport is full")
    end

  end
end
