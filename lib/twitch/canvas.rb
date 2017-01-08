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

    def clear_rect(position, size)
      `#{@context}.clearRect(#{position[0]}, #{position[1]}, #{size[0]}, #{size[1]})`
    end

    def clear
      clear_rect([0, 0], [@width, @height])
    end

    def draw_image(image, position, origin = [0, 0], angle = 0)
      `#{@context}.translate(#{-(origin[0] * image.width)}, #{-(origin[1] * image.height)})`
      `#{@context}.translate(#{origin[0] * image.width + position[0]}, #{origin[1] * image.height + position[1]})`
      `#{@context}.rotate(#{angle})`
      `#{@context}.translate(#{-(origin[0] * image.width + position[0])}, #{-(origin[1] * image.height + position[1])})`
      `#{@context}.drawImage(#{image.to_n}, #{image.x}, #{image.y}, #{image.width}, #{image.height}, #{position[0]}, #{position[1]}, #{image.width}, #{image.height})`
      `#{@context}.setTransform(1, 0, 0, 1, 0, 0)`
    end

    def draw_indicator(position, r = nil, color = '#FF00FF')
      `#{@context}.fillStyle = #{color}`
      `#{@context}.fillRect(#{position[0]}, #{position[1]}, 5, 5)`
      if r
        `#{@context}.beginPath()`
        `#{@context}.strokeStyle = #{color}`
        `#{@context}.arc(#{position[0]}, #{position[1]}, #{r}, 0, Math.PI*2)`
        `#{@context}.stroke()`
        `#{@context}.closePath()`
      end
    end

  end
end