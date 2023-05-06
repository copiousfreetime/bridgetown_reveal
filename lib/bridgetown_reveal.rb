# frozen_string_literal: true

require "bridgetown"

# @param config [Bridgetown::Configuration::ConfigurationDSL]
Bridgetown.initializer :bridgetown_reveal do |config|
  # Add code here which will run when a site includes
  # `init :bridgetown_reveal`
  # in its configuration

  # Add default configuration data:
  config.bridgetown_reveal ||= {}

  # You can optionally supply a source manifest:
  config.source_manifest(
    origin: BridgetownReveal,
    components: File.expand_path("../components", __dir__),
    layouts: File.expand_path("../layouts", __dir__)
  )
end
