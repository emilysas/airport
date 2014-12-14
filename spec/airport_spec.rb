require './lib/airport.rb'


describe Airport do
  let(:sunny_airport) {Airport.new(:capacity => 50)}
  let(:stormy_airport){Airport.new(:capacity => 6, :clear_weather => false)}
  let(:plane) {double :plane}
  
  context 'taking off and landing' do
    
    before {allow(sunny_airport).to receive(:playing_god){@stormy = false}}

      it 'a plane can land' do
        expect{sunny_airport.receive(plane)}.to change{sunny_airport.plane_count}.by(1)
      end

      it 'a plane can take off' do
        sunny_airport.receive(plane)
        expect{sunny_airport.request_takeoff(plane)}.to change{sunny_airport.plane_count}.by(-1)
      end

  end

  context 'traffic control' do
    
    before {allow(sunny_airport).to receive(:playing_god){@stormy = false}}

      it 'a plane cannot land if the airport is full' do
        allow(plane).to receive(:land!).with(sunny_airport)
        50.times{sunny_airport.receive(plane)}
        expect{sunny_airport.receive(plane)}.not_to change{sunny_airport.plane_count}
      end
  end


  context 'weather conditions' do

    before {allow(stormy_airport).to receive(:clear?){@clear_weather = false}}

      it 'a plane cannot take off when there is a storm brewing' do
        expect{ stormy_airport.request_takeoff(plane) }.not_to change{stormy_airport.plane_count}
      end

      it 'a plane cannot land in the middle of a storm' do
        expect{ stormy_airport.receive(plane) }.not_to change{stormy_airport.plane_count}
      end 
    
  end
end
