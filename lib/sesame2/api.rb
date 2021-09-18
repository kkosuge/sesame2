# frozen_string_literal: true

module Sesame2
  module Api
    attr_accessor :api_key, :client_id

    ENDPOINT_URL = "https://app.candyhouse.co/api/sesame2"

    def client
      @client ||= Faraday.new(url: ENDPOINT_URL)
    end

    def parse_response(response)
      parsed_response = response.headers["Content-Length"].to_i.positive? ? JSON.parse(response.body) : ""
      raise Error.new(response.status, parsed_response) if response.status >= 400

      parsed_response
    end

    def call(method, path, params = nil)
      response = client.send(method) do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.headers["x-api-key"] = @auth_token unless @auth_token.nil?
        req.body = params.to_json unless params.nil?
      end
      parse_response(response)
    end

    def get(path, params = nil)
      call(:get, path, params)
    end
  end
end
