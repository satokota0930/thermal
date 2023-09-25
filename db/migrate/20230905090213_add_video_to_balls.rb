class AddVideoToBalls < ActiveRecord::Migration[6.1]
  def change
    add_column :balls, :video, :string
  end
end
