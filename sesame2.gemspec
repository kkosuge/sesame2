# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sesame2/version"

Gem::Specification.new do |spec|
  spec.name          = "sesame2"
  spec.version       = Sesame2::VERSION
  spec.authors       = ["kkosuge"]
  spec.email         = ["root@kksg.net"]

  spec.summary       = "Ruby wrapper for the CANDYHOUSE Sesame 2 Web API (https://doc.candyhouse.co/ja/SesameAPI)"
  spec.homepage      = "https://github.com/kkosuge/sesame2"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kkosuge/sesame2"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "digest-cmac"
  spec.add_dependency "faraday"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
