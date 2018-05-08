class Recipe < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  #add validations
end
