require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) {double :airport}

  before {allow(airport).to receive(:playing_god){@stormy = false}}

    it 'has a flying status when created' do
      expect(plane).not_to be_flying
    end
      
    it 'can take off' do
      expect(airport).to receive(:request_takeoff).with(plane)
      plane.take_off(airport)
    end
    
    it 'changes its status to flying after taking of' do
      allow(airport).to receive(:request_takeoff).with(plane)
      expect(lambda {plane.take_off(airport)}).to change{plane.flying?}.from(false).to(true)
    end

end
