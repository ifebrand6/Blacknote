# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

use Rack::CanonicalHost, ENV['RAILS_HOSTNAME'] if ENV['RAILS_HOSTNAME'].present?
run Rails.application
