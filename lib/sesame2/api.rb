# frozen_string_literal: true

require "faraday"
require "json"

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

    def call(method, path, query = nil, body = nil)
      response = client.send(method) do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.headers["x-api-key"] = @api_key unless @api_key.nil?
        req.params = query unless query.nil?
        req.body = body.to_json unless body.nil?
      end
      parse_response(response)
    end

    def get(path, query = nil)
      call(:get, path, query, nil)
    end

    def post(path, query, body)
      call(:post, path, query, body)
    end
  end
end
