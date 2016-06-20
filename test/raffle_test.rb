require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative '../lib/raffle'

describe Raffle do

  let(:raffle) { Raffle }

  it "should get an empty message when raffle empty sample" do
    @samples = []
    raffle.do_raffle!(@samples).must_equal 'Empty list'
  end

  it 'should raffle and get an array item' do
    @samples = ['John']
    raffle.do_raffle!(@samples).must_be_instance_of String
  end

  it 'should remove an item from original array' do
    @samples = ['John', 'Jane', 'Mark', 'Steave']
    raffle.do_raffle!(@samples)
    @samples.size.must_equal 3
  end
end
