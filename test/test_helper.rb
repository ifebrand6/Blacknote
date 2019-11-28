# frozen_string_literal: true

# This has to come first
require_relative './support/rails'

# Load everything else from test/support
Dir[File.expand_path('support/**/*.rb', __dir__)].each { |rb| require(rb) }
