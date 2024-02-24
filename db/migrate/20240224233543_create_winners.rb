class CreateWinners < ActiveRecord::Migration[7.0]
  def change
    create_table :winners do |t|
      t.references :user, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.float :distance_to_treasure

      t.timestamps
    end
  end
end
