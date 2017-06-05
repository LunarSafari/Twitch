module Twitch
  class Animation
    def initialize images, interval
      @index = 0
      @total = images.size
      @images = images
      @interval = interval
    end

    def next_image
      image = @images[(@index / @interval) % @total]
      @index %= @interval * @total
      @index += 1
      image
    end

    def rewind
      @index = 1
    end
  end
end