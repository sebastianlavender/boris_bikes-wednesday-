require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :capacity}

 let(:bike) { double :bike, working: true }

  describe "#release_bike" do

    it "should release a bike" do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should give error when no bikes are docked and release_bike is used" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it 'should not release a bike if it has been reported as broken' do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:working).and_return(false)
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'No working bikes available'
    end
  end

  describe "#dock" do

    it "should dock a working bike" do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should give error when more than one bike is tried to be docked" do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike) }
      expect {subject.dock(bike)}.to raise_error "Docking station full"
    end
  end

  it "should allow you to change the capacity of the docking station" do
    test = DockingStation.new(30)
    expect(test.capacity).to eq 30
  end

end
