require 'spec_helper'
describe SensorReadingQuery do

  describe "initializing" do
    context "with a valid project" do
      Given(:project) { FactoryGirl.create(:project) }
      context "with existing sensors and data" do
        Given(:sensor_1) { project.find_or_create_sensor(1) }
        Given(:sensor_2) { project.find_or_create_sensor(2) }
      end
    end
  end

  describe "getting results" do
    context "with a valid project" do
      Given(:project) { FactoryGirl.create(:project) }
      context "with existing sensors and data" do
        Given(:sensor_1) { project.find_or_create_sensor(1) }
        Given(:sensor_2) { project.find_or_create_sensor(2) }
        Given!(:data) do
          SensorReading.create(sensor_id: sensor_1.id, time: DateTime.now, value: 1)
          SensorReading.create(sensor_id: sensor_2.id, time: DateTime.now - 1.year, value: 1)
        end

        context "getting all data" do
          When(:result) { SensorReadingQuery.new(project).result }
          Then { result[1][:readings].count.should == 1 }
          Then { result[2][:readings].count.should == 1 }
        end

        context "getting data for one sensor" do
          When(:result) { SensorReadingQuery.new(project, sensor_indices: [1] ).result }
          Then { result[1][:readings].count.should == 1 }
          Then { result[2].should be_nil }
        end

        context "data after a specified time" do
          Given(:time) { (DateTime.now - 1.month).to_s }
          When(:result) { SensorReadingQuery.new(project, start_time: time ).result }
          Then { result[1][:readings].count.should == 1 }
          Then { result[2][:readings].count.should == 0 }
        end

        context "data before a specified time" do
          Given(:time) { (DateTime.now - 1.month).to_s }
          When(:result) { SensorReadingQuery.new(project, end_time: time ).result }
          Then { result[1][:readings].count.should == 0 }
          Then { result[2][:readings].count.should == 1 }
        end
      end
    end
  end
end
