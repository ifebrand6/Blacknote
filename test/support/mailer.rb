# frozen_string_literal: true

class ActiveSupport::TestCase
  setup { ActionMailer::Base.deliveries.clear }
end
