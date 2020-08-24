class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
