# frozen_string_literal: true

class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :body
      t.string :img, default: 'no_image.jpg'
      t.timestamps
    end
  end
end
