module Twitch
  class Control
    def self.init
      @keydown = {}
      when_keydown = ->(e){
        @keydown[e.JS[:key]] = true
      }
      when_keyup = ->(e){
        @keydown[e.JS[:key]] = false
      }
      `window.addEventListener('keydown', #{when_keydown.to_n})`
      `window.addEventListener('keyup', #{when_keyup.to_n})`
      Game.register(self)
    end

    def self.update

    end
  end
end