class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mover_id
end
