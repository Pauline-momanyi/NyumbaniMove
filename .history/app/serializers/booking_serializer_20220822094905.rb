class BookingSerializer < ActiveModel::Serializer
  attributes :id, :date, :origin, :destination, :distance, :cost
end
