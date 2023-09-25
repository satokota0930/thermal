class AddImageToBalls < ActiveRecord::Migration[6.1]
  def change
    add_column :balls, :image, :string
  end
end
