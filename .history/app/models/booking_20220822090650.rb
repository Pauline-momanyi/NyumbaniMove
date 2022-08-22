class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :mover_id
end
