class Amount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :unit, optional: true
  belongs_to :preparation_method, optional: true
end
