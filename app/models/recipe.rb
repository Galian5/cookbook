class Recipe < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  belongs_to :user
  #add validations
  #add association
end
