class Sensor
  include Mongoid::Document
  embedded_in :project
  has_many :sensor_readings

  field :name
  field :project_index, type: Integer

  def self.find_or_create(project, index)
    s = Sensor.where(project_id: project.id, project_index: index).first
    unless s
      s = project.sensors.build(project_index: index)
      project.save
    end
    s
  end

end
