require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :bike}

  describe "#release_bike" do

    it "should release a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "should give error when no bikes are docked and release_bike is used" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe "#dock" do

    it "should dock a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it "should give error when more than one bike is tried to be docked" do
      bike, bike2 = Bike.new
      subject.dock(bike)
      expect {subject.dock(bike2)}.to raise_error "Docking station full"
    end
  end



end
