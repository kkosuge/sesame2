# frozen_string_literal: true

require "digest/cmac"

module Sesame2
  class Sesame
    include ::Sesame2::Api

    attr_accessor :sesame2_uuid, :key_secret_hex

    module CMD
      TOGGLE = 88
      LOCK = 82
      UNLOCK = 83
    end

    def initialize(sesame2_uuid:, key_secret_hex:)
      @sesame2_uuid = sesame2_uuid
      @key_secret_hex = key_secret_hex
    end

    def status
      get(@sesame2_uuid)
    end

    def history(page: 1, lg: 20)
      get("#{@sesame2_uuid}/history", { page: page, lg: lg })
    end

    def sign
      message = [Time.now.to_i].pack("i*").unpack1("H*")[2, 8]
      key = [@key_secret_hex].pack("H*")
      cmac = Digest::CMAC.new(OpenSSL::Cipher.new("aes-128-cbc"), key)
      cmac.update([message].pack("H*"))
      digest = cmac.digest
      digest.unpack1("H*")
    end

    def cmd(command:, history: "")
      encoded_history = [history].pack("m")

      post("#{@sesame2_uuid}/cmd", nil, {
             cmd: command,
             history: encoded_history,
             sign: sign
           })
    end

    def toggle(history: "")
      cmd(command: CMD::TOGGLE, history: history)
    end

    def lock(history: "")
      cmd(command: CMD::LOCK, history: history)
    end

    def unlock(history: "")
      cmd(command: CMD::UNLOCK, history: history)
    end
  end
end
