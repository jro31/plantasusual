class Amount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :unit
  belongs_to :preparation_method, optional: true
end
