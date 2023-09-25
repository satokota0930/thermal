class CreateBalls < ActiveRecord::Migration[6.1]
  def change
    create_table :balls do |t|
      t.text :title
      t.text :body
      t.text :address

      t.timestamps
    end
  end
end
