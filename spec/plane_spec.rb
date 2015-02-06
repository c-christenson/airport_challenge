require 'plane'

describe Plane do
 
  let(:plane) { Plane.new }
  let(:airport) {double :airport}
  
  it 'has a flying status when created' do
  	expect(plane.status).to eq :flying
  end
  
  it 'has a flying status when in the air' do
  	plane.takeoff
  	expect(plane.status).to eq :flying
   end
  
   it 'can take off' do
   	plane.land
   	plane.takeoff
   	expect(plane.status).to eq :flying
   end
  
   it 'changes its status to flying after taking off' do
   	plane.land
   	expect(plane.status).to eq :landed
   	plane.takeoff
   	expect(plane.status).to eq :flying
   end

 end
 
# # grand final
# # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # Be careful of the weather, it could be stormy!
# # Check when all the planes have landed that they have the right status "landed"
# # Once all the planes are in the air again, check that they have the status of flying!
# describe "The gand finale (last spec)" do
#   it 'all planes can land and all planes can take off' do
#   end
#end