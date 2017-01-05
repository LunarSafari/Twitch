module Twitch
  class Canvas
    def initialize(canvas_element, width:0 , height: 0)
      @element = canvas_element
      @context = @element.JS.getContext('2d')
      @width = width
      @height = height
    end

    def draw_rect(position, size)
      `#{@context}.strokeRect(#{position[0]}, #{position[1]}, #{size[0]}, #{size[1]})`
    end

    def clear_rect(position, width, height)
      `#{@context}.clearRect(#{position[0]}, #{position[1]}, #{width}, #{height})`
    end

    def clear
      clear_rect([0, 0], @width, @height)
    end

    def draw_image(image, position)
      `#{@context}.drawImage(#{image.to_n}, #{image.x}, #{image.y}, #{image.width}, #{image.height}, #{position[0]}, #{position[1]}, #{image.width}, #{image.height})`
    end
  end
end