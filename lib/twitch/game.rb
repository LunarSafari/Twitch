module Twitch
  class Game

    def initialize canvas, **options
      @canvas = canvas
      @objects = []
    end

    def loop!
      last_timestamp = 0
      func = ->(timestamp){
        update(timestamp - last_timestamp)
        draw
        last_timestamp = timestamp
        `requestAnimationFrame(#{func.to_n})`
      }
      init_func = ->(timestamp){
        last_timestamp = timestamp
        `requestAnimationFrame(#{func.to_n})`
      }
      `requestAnimationFrame(#{init_func.to_n})`
    end

    def update dt
      @objects.each{|o| o.update dt}
    end

    def draw
      @canvas.clear
      @objects.each{|o| o.draw @canvas if o.respond_to? :draw }
    end

    def register object
      @objects << object
    end

    def remove object
      @objects.delete(object)
    end
  end
end