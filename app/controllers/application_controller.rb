# frozen_string_literal: true

class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    # @city = request.location.city
    layout :layout_by_resource

    def layout_by_resource
        if devise_controller? and user_signed_in?
        'react'
        else
        'application'
        end
    end
end
