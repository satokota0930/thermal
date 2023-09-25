class AddTeamnameToBalls < ActiveRecord::Migration[6.1]
  def change
    add_column :balls, :teamname, :string
  end
end
