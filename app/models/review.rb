class Review < ApplicationRecord
  belongs_to :cafe
  # enum outlets: [ :few, :some, :many]
  # enum coffeeQuality: [ :"Decent Coffee", :"Good Coffee", :"Exceptional Coffee"]
  # enum teaQuality: [ :"Decent Tea", :"Good Tea", :"Exceptional Tea"]
  serialize :vibe, Array
  serialize :food, Array
end
