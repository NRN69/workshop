# frozen_string_literal: true

class ChangePostsToBlogs < ActiveRecord::Migration[7.0]
  def change
    rename_table :posts, :blogs
  end
end
