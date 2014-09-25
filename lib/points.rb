require 'fiddle'
require 'fiddle/import'

module RustPoint
  extend Fiddle::Importer

  dlload "./ext/libpoints.dylib"

  extern "Point* make_point(int, int)"
  extern "double get_distance(Point*, Point*)"

  def self.new(*args)
    make_point(*args)
  end

  def self.distance(*args)
    get_distance(*args)
  end
end

class RubyPoint
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def self.distance(p1, p2)
    xdiff = p1.x - p2.x
    ydiff = p1.y - p2.y
    Math.sqrt(xdiff ** 2 + ydiff ** 2)
  end
end
