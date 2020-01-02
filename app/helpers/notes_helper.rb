# frozen_string_literal: true

module NotesHelper
  def render_with_hashtags(content)
    content.gsub(/#\w+/) { |word| link_to word, "/notes/hashtag/#{word.delete('#')}" }.html_safe
  end
end
