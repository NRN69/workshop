class AddFileToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :file, :string, default: nil
  end
end
