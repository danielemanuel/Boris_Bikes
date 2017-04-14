require 'dockingstation'

describe DockingStation do

  describe '#dock' do
    it {is_expected.to respond_to(:dock).with(1).argument }
    let(:bike) { double :bike }
    it 'docks a bike' do
      allow(bike).to receive(:dock)
      subject.dock(bike)
      dock_bikes = subject.dock(:bike)
      expect(dock_bikes).to be
    end
    it 'returns a bike that has been docked' do
      bike = double(:bike)
      allow(bike).to receive(:dock)
      subject.dock bike
      expect(subject.bikes).to eq [bike]
    end
    it 'raises an error when dockingstation is full' do
      (subject.capacity).times { subject.dock double(:bike) }
      expect{subject.dock double(:bike)}.to raise_error(RuntimeError)
    end
  end

  describe '#release_bike' do
    it {is_expected.to respond_to :release_bike}
    it 'raises an error when no bikes' do
      expect{subject.release_bike}.to raise_error(RuntimeError)
    end
    let(:bike) { double :bike }
    it 'releases a bike that works' do
      subject.dock double(:bike, broken?: false, working?: true )
      bike = subject.release_bike
      expect(bike).to be_working
    end
    it 'doesnt release a broken bike' do
      bike = double(:bike)
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error(RuntimeError)
    end

  end

  describe "#return_bikes" do
        it { is_expected.to respond_to :return_bike }
        it 'raises an error when all the bikes are returned' do
          (subject.capacity).times { subject.return_bike double(:bike) }
          expect{subject.return_bike double(:bike)}.to raise_error(RuntimeError)
        end

    end

  describe '#initialize' do
    it 'sets capacity' do
      expect(subject.capacity).to be DockingStation::DEFAULT_CAPACITY
    end
  end
end
