class BookingSerializer < ActiveModel::Serializer
  attributes :id, :date, :origin, :destination, :distance, :cost
  belongs_to user
  belongs_to :
end
