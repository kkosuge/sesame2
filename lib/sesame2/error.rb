# frozen_string_literal: true

module Sesame2
  class Error < StandardError
    attr_reader :status, :code

    def initialize(status, data)
      super(data["error"])
      @data = data
      @status = status
    end

    def to_s
      %(#{@data["error"]} HTTP: #{status})
    end
  end
end
