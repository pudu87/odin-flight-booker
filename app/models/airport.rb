class Airport < ApplicationRecord
  validates :code, format: { with: /[A-Z][A-Z][A-Z]/, message: "allows 3 capital letters" }
end
