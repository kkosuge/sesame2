# frozen_string_literal: true

module Sesame2
  class Client
    include ::Sesame2::Api

    def initialize(api_key:, client_id: nil)
      @api_key = api_key
      @client_id = client_id
    end

    def sesame(sesame2_uuid:, key_secret_hex:)
      sesame = ::Sesame2::Sesame.new(
        sesame2_uuid: sesame2_uuid,
        key_secret_hex: key_secret_hex
      )
      sesame.api_key = @api_key
      sesame.client_id = @client_id
      sesame
    end
  end
end
