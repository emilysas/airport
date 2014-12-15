require 'plane'

describe Plane do

  let(:plane) { Plane.new}
  let(:airport) {double :airport}

  before {allow(airport).to receive(:clear?).and_return(true)}

    it 'has a flying status when created' do
      expect(plane).to be_flying
    end
      
    it 'can take off' do
      expect(airport).to receive(:permit_takeoff).with(plane)
      plane.take_off!(airport)
    end
    
    it 'a plane that has landed changes its status to flying after taking of' do
      allow(airport).to receive(:receive).with(plane).and_return(true)
      plane.land!(airport)
      allow(airport).to receive(:permit_takeoff).with(plane).and_return(true)
      expect{plane.take_off!(airport)}.to change{plane.flying?}.from(false).to(true)
    end

end
