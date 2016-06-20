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

  it "should get an String when raffle samples" do
    @samples = ['John']
    raffle.do_raffle!(@samples).must_be_instance_of String
  end

  it 'should raffle one sample and get this' do
    @samples = ['John']
    raffle.do_raffle!(@samples).must_equal 'John'
    @samples.size.must_equal 0
  end

  it 'should remove an item from original sample' do
    @samples = ['John', 'Jane', 'Mark', 'Steave']
    raffle.do_raffle!(@samples)
    @samples.size.must_equal 3
  end

  it 'should get empty message when raffle the same number of samples' do
    @samples = ['John']
    raffle.do_raffle!(@samples)
    raffle.do_raffle!(@samples).must_equal 'Empty list'
    @samples.size.must_equal 0
  end
end
