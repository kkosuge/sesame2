# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "sesame2/version"
require_relative "sesame2/api"
require_relative "sesame2/client"
require_relative "sesame2/error"
require_relative "sesame2/sesame"

module Sesame2
  class Error < StandardError; end
  # Your code goes here...
end
