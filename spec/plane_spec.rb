require 'plane'

describe Plane do
 
  let(:plane) { Plane.new }
  
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
 


