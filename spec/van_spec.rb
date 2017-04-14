require 'van'

describe Van do
  it 'checks if Van exists' do
    Van
  end
  it {is_expected.to respond_to :collect_broken}
  it 'cannot collect if there are no broken bikes' do
    expect {subject.collect_broken}.to raise_error(RuntimeError)
  end
  it 'collect broken bikes' do
    expect {subject.collect_broken}
  end
  # let(:bike) { double :bike }
  # it 'collect broken bikes' do
  #   subject.dock double(:bike, broken?: true, working?: false )
  #   bike = subject.collect_broken
  #   expect(bike).to be_working
  # end

end
