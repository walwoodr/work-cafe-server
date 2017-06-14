class RemoveReviewsFromCafes < ActiveRecord::Migration[5.0]
  def change
    remove_column :cafes, :outlets
    remove_column :cafes, :vibe
    remove_column :cafes, :food
    remove_column :cafes, :genderNeutralRestrooms
    remove_column :cafes, :coffeeQuality
    remove_column :cafes, :teaQuality
  end
end
