class SensorReadingQuery
  include ActiveModel::Validations

  attr_accessor :project, :sensors, :start_time, :end_time, :result_limit, :result_type

  validates :project, :result_type, presence: true
  validates :result_type, inclusion: {in: %i(json)}
  def initialize(project, options)
    self.project = project
    self.sensors = project.get_sensors options[:sensor_indices]
    self.start_time = options[:start_time] ? DateTime.parse(options[:start_time]).utc : nil
    self.end_time = options [:end_time] ? DateTime.parse(options[:end_time]).utc : nil
    self.result_limit = options[:result_limit].try(:to_i)
    self.result_type = options[:result_type].try(:to_sym) || :json
    super
  end
end
