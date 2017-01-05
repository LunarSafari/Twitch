class Vector
  attr_reader :elements

  def initialize array
    @elements = array
  end

  def self.[](*array)
    new array
  end

  %w{x y z w}.each_with_index do |n, i|
    define_method(n){ @elements[i] }
  end

  def [](i)
    @elements[i]
  end

  def + v
    self.class.new @elements.map.with_index{|e,i| e + v.elements[i]}
  end

  def -@
    self.class.new @elements.map{|e| -e}
  end

  def - v
    self + -v
  end

  def * n
    self.class.new @elements.map{|e| e * n}
  end

  def / n
    self * (1 / n)
  end

  def magnitude
    Math.sqrt(@elements.inject(0) {|v, e| v + e.abs2})
  end

  def normalize
    n = magnitude
    return self.class.new @elements.map{ 0 } if n == 0
    self / n
  end

  def inspect
    "Vector#{@elements.inspect}"
  end
  alias :to_s :inspect
end