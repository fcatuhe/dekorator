# frozen_string_literal: true

require "action_view"
require "digest/md5"

class ApplicationDecorator < Dekorator::Base; end

class UserDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetTagHelper

  decorates_association :posts
  decorates_association :comments

  def full_name
    [first_name, last_name].join(" ")
  end

  def gravatar_image_tag
    image_tag("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}", alt: "")
  end
end

class PostDecorator < ApplicationDecorator
  decorates_association :user
  decorates_association :comments
end

class AdvancedPostDecorator < PostDecorator; end

class CommentDecorator < ApplicationDecorator
  decorates_association :user
  decorates_association :post
end
