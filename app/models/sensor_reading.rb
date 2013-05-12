class SensorReading
  include Mongoid::Document

  belongs_to :sensor
  field :time, type: DateTime
  field :value
end
