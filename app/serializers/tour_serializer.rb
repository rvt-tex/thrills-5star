class TourSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :cost, :duration, :description, :image, :location
end
