module Twitch
  class Game
    def self.init(canvas, **options)
      @canvas = canvas
      @objects = []
    end

    def self.loop!
      last_timestamp = 0
      func = ->(timestamp){
        dt = timestamp - last_timestamp
        update(dt)
        draw if dt < 16.7
        last_timestamp = timestamp
        `requestAnimationFrame(#{func.to_n})`
      }
      init_func = ->(timestamp){
        last_timestamp = timestamp
        `requestAnimationFrame(#{func.to_n})`
      }
      `requestAnimationFrame(#{init_func.to_n})`
    end

    def self.update dt
      @objects.each{|o| o.update dt }
    end

    def self.draw
      @canvas.clear
      @objects.each{|o| o.draw @canvas if o.respond_to? :draw }
    end

    def self.register object
      @objects << object
    end

    def self.remove object
      @objects.delete(object)
    end
  end
end