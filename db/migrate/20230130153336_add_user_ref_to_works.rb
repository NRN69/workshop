# frozen_string_literal: true

class AddUserRefToWorks < ActiveRecord::Migration[7.0]
  def change
    add_reference :works, :user, foreign_key: true
  end
end
