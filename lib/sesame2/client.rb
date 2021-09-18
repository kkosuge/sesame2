# frozen_string_literal: true

module Sesame2
  class Client
    include ::Sesame2::Api

    def initialize(api_key:, client_id:)
      @api_key = api_key
      @client_id = client_id
    end
  end
end
