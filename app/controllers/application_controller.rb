# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # @city = request.location.city
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && user_signed_in?
      'react'
    else
      'devise'
    end
  end
end
