require 'bike'

describe Bike do
  it {is_expected.to respond_to :working}
  it {is_expected.to respond_to :report_broken}

  it 'should allow to report broken bikes' do
    subject.report_broken
    expect(subject.working).to eq false
  end
end
