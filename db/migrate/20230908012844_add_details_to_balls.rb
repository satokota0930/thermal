class AddDetailsToBalls < ActiveRecord::Migration[6.1]
  def change
    add_column :balls, :lat, :float
    add_column :balls, :lng, :float
  end
end
