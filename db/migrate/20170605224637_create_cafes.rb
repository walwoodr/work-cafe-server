class CreateCafes < ActiveRecord::Migration[5.0]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :zipcode
      t.string :address
      t.string :hours # I am concerned about this
      t.string :website
      t.integer :outlets
      t.string :vibe
      t.string :food
      t.boolean :genderNeutralRestrooms
      t.integer :coffeeQuality
      t.integer :teaQuality

      t.timestamps
    end
  end
end
