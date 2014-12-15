require './lib/airport.rb'


describe Airport do
  let(:airport){Airport.new(capacity: 50)}
  let(:plane) {double :plane}
  
  context 'taking off and landing' do
    
    before {allow(airport).to receive(:clear?).and_return(true)}

      it 'a plane can land' do
        expect{airport.receive(plane)}.to change{airport.plane_count}.by(1)
      end

      it 'a plane can take off' do
        airport.receive(plane)
        expect{airport.permit_takeoff(plane)}.to change{airport.plane_count}.by(-1)
      end

  end

  context 'traffic control' do
    
    before {allow(airport).to receive(:clear?).and_return(true)}

      it 'a plane cannot land if the airport is full' do
        allow(plane).to receive(:land!).with(airport)
        50.times{airport.receive(plane)}
        expect{airport.receive(plane)}.to raise_error("Full")
      end
  end


  context 'weather conditions' do

    before {allow(airport).to receive(:clear?).and_return(false)}

      it 'a plane cannot take off when there is a storm brewing' do
        expect{airport.permit_takeoff(plane) }.to raise_error("Stormy")
      end

      it 'a plane cannot land in the middle of a storm' do
        expect{airport.receive(plane) }.to raise_error("Stormy")
      end 
    
  end
end
