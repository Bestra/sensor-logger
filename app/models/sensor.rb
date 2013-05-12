class Sensor
  include Mongoid::Document
  belongs_to :project
  has_many :sensor_readings

  field :name
  field :project_index
end
