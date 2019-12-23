# frozen_string_literal: true

# Renders the home page.
class HomeController < ApplicationController
  skip_before_action :get_category, only: %i[index]
  layout 'landing_page'
  def index
   
  end
  # fdfd
end
