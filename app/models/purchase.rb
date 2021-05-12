class Purchase < ApplicationRecord
  belongs_to       :user
  belongs_to       :furima
  has_one          :street_addresses

  with_options presence: true do
    validates :user_id
    validates :furima_id
  end
end
