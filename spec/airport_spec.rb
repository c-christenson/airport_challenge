require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  #why would you need doubles here?
  #if I add functionalty to my classes, is it wrong to go back and change the wording of the original tests?
  #Ie: a plane can land test no longer works unless we stub the appropriate weather

 context 'taking off and landing' do

      it 'a plane can land if it is sunny' do
        allow(airport).to receive(:check_weather).and_return(:sunny)
      	airport.let_plane_land(plane)
      	expect{airport.let_plane_land(plane)}.to change{airport.landed_plane_count}.by 1    	
      end
    
      it 'a plane can take off if it is sunny' do
        allow(airport).to receive(:check_weather).and_return(:sunny)
        airport.let_plane_land(plane)
        expect{airport.tell_plane_to_takeoff(plane)}.to change{airport.landed_plane_count}.by -1
        airport.tell_plane_to_takeoff(plane)
      end

      it 'plane status should be landed when permission to land confirmed' do
        allow(airport).to receive(:check_weather).and_return(:sunny)
        airport.let_plane_land(plane)
        expect{airport.let_plane_land(plane)}.to change{airport.landed_plane_count}.by 1
        expect(plane.status).to eq :landed
      end


  end
  
  context 'traffic control' do

     it 'a plane cannot land if the airport is full and it is sunny' do
        allow(airport).to receive(:check_weather).and_return(:sunny)
      	6.times{ airport.let_plane_land(plane) }
        expect{ airport.let_plane_land(plane) }.to raise_error 'Airport is full'
      end
    
  end

  context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
       allow(airport).to receive(:check_weather).and_return(:stormy) 
       expect{airport.tell_plane_to_takeoff(plane)}.to raise_error 'Permission to takeoff denied: the weather is too stormy.'
      end
      
       it 'a plane cannot land in the middle of a storm' do
          allow(airport).to receive(:check_weather).and_return(:stormy)
          expect{airport.let_plane_land(plane)}.to raise_error 'Permission to land denied: the weather is too stormy.'
       end
     
  end
  
#   context "The gand finale (last spec)" do
#      let(:airport) { Airport.new }
#      let(:plane1) { Plane.new }

#       it 'all planes can land and all planes can take off' do
#       end

# # # Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# # # Be careful of the weather, it could be stormy!
# # # Check when all the planes have landed that they have the right status "landed"
# # # Once all the planes are in the air again, check that they have the status of flying!
#   end

 end