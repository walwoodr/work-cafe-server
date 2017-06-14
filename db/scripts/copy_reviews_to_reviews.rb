require 'rubygems'

Cafe.all.each do |cafe|
  if cafe.outlets != nil || cafe.vibe != [] || cafe.food != [] || cafe.genderNeutralRestrooms != nil || cafe.coffeeQuality != nil || cafe.teaQuality != nil
    review = Review.new(
      cafe_id: cafe.id,
      outlets: cafe.outlets,
      vibe: cafe.vibe,
      food: cafe.food,
      genderNeutralRestrooms: cafe.genderNeutralRestrooms,
      coffeeQuality: cafe.coffeeQuality,
      teaQuality: cafe.teaQuality
    )
    review.save!
  end
end
