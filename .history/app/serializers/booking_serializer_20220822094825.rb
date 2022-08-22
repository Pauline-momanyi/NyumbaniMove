class BookingSerializer < ActiveModel::Serializer
  attributes :id, :date, :origin, :destination, :distance, :cost
  has_one :user
  has_one :mover
end
