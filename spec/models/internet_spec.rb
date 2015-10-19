require "spec_helper"

describe Internet do
  before do
    @i = Internet.new(ip: '192.168.1.1')
  end

  it 'needs a name' do
    refute @i.valid?
  end

  it 'only needs a name' do
    @i.name = 'Frank'
    assert @i.valid?
  end

end
