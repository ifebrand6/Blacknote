# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # @city = request.location.city
  before_action :set_variables
  before_action :get_category
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && user_signed_in?
      'react'
    else
      'devise'
    end
  end
  def set_variables
    @accessnote = Note.all
  end
  def get_category
    @category = Category.find(1)
  end
end
