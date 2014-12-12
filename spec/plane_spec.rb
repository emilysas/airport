require 'plane'
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do

  let(:plane) { Plane.new }
  let(:airport) {double :airport}

  it 'has a flying status when created' do
    expect(plane).not_to be_flying
  end
  
  it 'has a flying status when in the air' do
    plane.take_off(from: airport)
    expect(plane).to be_flying
  end
  
  xit 'can take off' do
  
  end
  
  xit 'changes its status to flying after taking of' do
  
  end

end
