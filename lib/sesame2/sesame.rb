# frozen_string_literal: true

module Sesame2
  class Sesame
    include ::Sesame2::Api

    attr_accessor :sesame2_uuid

    def initialize(sesame2_uuid:)
      @sesame2_uuid = sesame2_uuid
    end

    def status
      get(@sesame2_uuid)
    end
  end
end
