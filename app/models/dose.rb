class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :ingredient, uniqueness: {scope: :cocktail, message: "You cannot have the same ingredient twice in the same cocktail"}
end
