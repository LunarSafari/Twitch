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
  end
end