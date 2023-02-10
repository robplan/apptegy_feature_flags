# frozen_string_literal: true

require "flipper-cloud"
require_relative "apptegy_feature_flags/version"

module ApptegyFeatureFlags
  class Error < StandardError
  end
end

# Top level namespace for all Apptegy gems
module Apptegy
  FEATURE_FLAGS_TOKEN = ENV.fetch("APPTEGY_FEATURE_FLAGS_TOKEN", "missing_feature_flags_token")
  FeatureFlags = Flipper

  Flipper.configure do |config|
    config.default do
      Flipper::Cloud.new({ token: FEATURE_FLAGS_TOKEN })
    end
  end
end

Apptegy::FeatureFlags.features
