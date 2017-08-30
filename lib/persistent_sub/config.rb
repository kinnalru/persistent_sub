# frozen_string_literal: true

module PersistentSub
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :strict, :autoclean

    def initialize
      @strict = false
      @autoclean
    end

  end
end
