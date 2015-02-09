require 'airport'


describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double 'plane', land: :landed, takeoff: :flying }

  #why would you need doubles here?
  #if I add functionalty to my classes, is it wrong to go back and change the wording of the original tests?
  #Ie: a plane can land test no longer works unless we stub the appropriate weather

 context 'takeoff & landing' do

  before do
    allow(airport).to receive(:check_weather).and_return(:sunny)
  end

      it 'landing when sunny' do
        expect(plane).to receive(:land)
      	airport.let_plane_land(plane)
      	expect{airport.let_plane_land(plane)}.to change{airport.landed_plane_count}.by 1    	
      end
    
      it 'take off when sunny' do
        expect(plane).to receive(:takeoff)
        airport.let_plane_land(plane)
        expect{airport.tell_plane_to_takeoff(plane)}.to change{airport.landed_plane_count}.by -1
        airport.tell_plane_to_takeoff(plane)
      end

      it 'plane status should be landed when permission to land confirmed' do
        airport.let_plane_land(plane)
        expect{airport.let_plane_land(plane)}.to change{airport.landed_plane_count}.by 1
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


 end





















