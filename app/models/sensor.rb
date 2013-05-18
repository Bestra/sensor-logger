class Sensor
  include Mongoid::Document
  embedded_in :project
  has_many :sensor_readings

  field :name
  field :project_index
end
