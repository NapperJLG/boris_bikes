require 'docking_station'

describe DockingStation do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes) }

describe '#dock' do
    it "throws 'no space available' error if number of bikes > 20" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect{ subject.dock(Bike.new) }.to raise_error("No space available")
    end

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

  end

    describe '#release_bike' do
      it "throws 'no bike available' error when there is no bike" do
        expect{ subject.release_bike }.to raise_error("No bikes available")
      end

      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'releases a working bike' do
        bike = Bike.new
        subject.dock(bike)
        bike = subject.release_bike
        expect(bike).to be_working
    end

end
