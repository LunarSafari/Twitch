module Twitch
  class Image
    attr_reader :x, :y, :width, :height
    def initialize image_object, position = [0, 0], size = [image_object.JS[:width], image_object.JS[:height]]
      @image_object = image_object
      @x = position[0]
      @y = position[1]
      @width = size[0]
      @height = size[1]
      @src = image_object.JS[:src]
    end

    def inspect
      "#<Twitch::Image @x=#{@x} @y=#{@y} @width=#{@width} @height=#{@height} @src=#{@src}>"
    end
    alias :to_s :inspect

    def loaded?
      @image_object.JS[:complete]
    end

    def to_n
      @image_object
    end
  end
end