require 'plane'

describe Plane do
  
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
  	expect(plane.status).to eq :flying
  end
  
  it 'has a flying status after takeoff' do
    plane.land
  	plane.takeoff
  	expect(plane.status).to eq :flying
   end
  
   it 'can take off' do
   	plane.land
   	plane.takeoff
   	expect(plane.status).to eq :flying
   end
 end
 


