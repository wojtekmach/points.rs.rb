require 'points'
require 'minitest/autorun'

describe 'Point' do
  specify 'Ruby' do
    p1 = RubyPoint.new(10, 10)
    p2 = RubyPoint.new(20, 20)
    assert_in_delta 14.14, RubyPoint.distance(p1, p2), 0.01
  end

  specify 'Rust' do
    p1 = RustPoint.new(10, 10)
    p2 = RustPoint.new(20, 20)
    assert_in_delta 14.14, RustPoint.distance(p1, p2), 0.01
  end
end

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report 'ruby' do
    p1 = RubyPoint.new(10, 10)
    p2 = RubyPoint.new(20, 20)
    RubyPoint.distance(p1, p2)
  end

  x.report 'rust' do
    p1 = RustPoint.new(10, 10)
    p2 = RustPoint.new(20, 20)
    RustPoint.distance(p1, p2)
  end
end if ENV['BENCH']
