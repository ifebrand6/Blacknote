# frozen_string_literal: true

# Renders the home page.
class HomeController < ApplicationController
  layout 'landing_page'
  def index
    @category = Category.where(id: 1)
  end
end
