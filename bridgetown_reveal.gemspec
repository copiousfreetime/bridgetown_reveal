# frozen_string_literal: true

require_relative "lib/bridgetown_reveal/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown_reveal"
  spec.version       = BridgetownReveal::VERSION
  spec.author        = "Jeremy Hinegardner"
  spec.email         = "jeremy@copiousfreetime.org"
  spec.summary       = "Support adding reveal.js presentations to a Bridgetown site."
  spec.homepage      = "https://github.com/copiousfreetime/bridgetown_reveal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]
  spec.metadata      = { 
    "bug_tracker_uri" => "https://github.com/copiousfreetime/bridgetown_reveal/issues",
    "changelog_uri" => "https://github.com/copiousfreetime/bridgetown_reveal/blob/master/CHANGELOG.md",
    "homepage_uri" => "https://github.com/copiousfreetime/bridgetown_reveal",
    "source_code_uri" => "https://github.com/copiousfreetime/bridgetown_reveal",
    "yarn-add" => "reveal.js@#{BridgetownReveal::REVEAL_JS_VERSION}"
  }

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_dependency "bridgetown", ">= 1.2.0", "< 2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.3"
end
