# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :img, default: 'no_image.jpg'
      t.timestamps
    end
  end
end
