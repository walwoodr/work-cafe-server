class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :cafe_id
      t.integer :outlets
      t.text :vibe
      t.text :food
      t.boolean :genderNeutralRestrooms
      t.integer :coffeeQuality
      t.integer :teaQuality

      t.timestamps
    end
  end
end
