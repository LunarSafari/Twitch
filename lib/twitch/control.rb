module Twitch
  class Control

    class << self
      attr_reader :keydown

      def init
        unless @initialized
          @keydown = {}
          when_keydown = ->(e){
            @keydown[e.JS[:key]] = true
          }
          when_keyup = ->(e){
            @keydown[e.JS[:key]] = false
          }
          `window.addEventListener('keydown', #{when_keydown.to_n})`
          `window.addEventListener('keyup', #{when_keyup.to_n})`
          @initialized = true
        end
      end
    end

    def keydown
      self.class.keydown
    end

    def initialize
      self.class.init
    end

    def define &block
      singleton_class.class_eval &block
      self
    end
  end
end