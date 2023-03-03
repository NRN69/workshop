class AddFileToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :file, :string, default: nil
  end
end
