# frozen_string_literal: true

namespace :test do
  task :coverage do
    require 'simplecov'
    Rake::Task['test'].execute
  end
end
