# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # @city = request.location.city
  before_action :set_variables
  before_action :set_category
  before_action :prepare_meta_tags
  layout :layout_by_resource

  
  end
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
  def set_category
    @category = Category.find_or_create_by(id:1, name: "All")
  end
  def prepare_meta_tags(options={})
    site_name   = "Blacknote"
    title       = [controller_name, action_name].join(" ")
    description = "Black Note is a new way to save memories, the app that will help you beautifully showcase your orignality, creative art or anything else, you can make with words!."
    image       = options[:image] || "your-default-image-url"
    current_url = request.url
end

