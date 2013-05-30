class SensorReadingQuery
  include ActiveModel::Validations

  attr_accessor :project, :sensors, :start_time, :end_time, :result_limit, :result_type

  validates :project, :result_type, presence: true
  validates :result_type, inclusion: {in: %i(json)}
  def initialize(project, options={})
    self.project = project
    self.sensors = options[:sensor_indices] ? project.get_sensors(options[:sensor_indices]) : project.sensors
    self.start_time = options[:start_time] ? DateTime.parse(options[:start_time]).utc : nil
    self.end_time = options [:end_time] ? DateTime.parse(options[:end_time]).utc : nil
    self.result_limit = options[:result_limit].try(:to_i) || 0
    self.result_type = options[:result_type].try(:to_sym) || :json
  end

  def result
    @result ||= run_query
  end

  private
  def start_time_query(query)
    self.start_time ? query.gte(time: self.start_time) : query
  end

  def end_time_query(query)
    self.end_time ? query.lte(time: self.end_time) : query
  end

  def time_query(query)
    query = start_time_query(query)
    query = end_time_query(query)
  end

  def run_query
    sensor_results = {}
    self.sensors.each do |sensor|
      query = time_query(SensorReading.where(sensor_id: sensor)).order_by(time: "asc").limit(self.result_limit).only(:time, :value)
      sensor_results[sensor.project_index] = {}
      sensor_results[sensor.project_index][:readings] = query.entries
    end
    sensor_results
  end
end
