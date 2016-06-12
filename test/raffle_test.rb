require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative '../lib/raffle'

describe Raffle do
  before do
    @samples = ['John', 'Jane', 'Mark', 'Steave']
  end

  let(:raffle) { Raffle }

  it 'should raffle and get an array item' do
    raffle.do_raffle!(@samples).must_be_instance_of String
  end

  it 'should remove an item from original array' do
    raffle.do_raffle!(@samples)
    @samples.size.must_equal 3
  end
end
