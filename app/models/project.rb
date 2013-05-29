class Project
  include Mongoid::Document
  belongs_to :user
  embeds_many :sensors

  field :name
  field :description

  def sensor(index)
    s = self.sensors.where(project_index: index).first
  end

  def find_or_create_sensor(index)
    s = self.sensors.find_or_create_by(project_index: index)
  end
end
