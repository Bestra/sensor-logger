require 'spec_helper'
describe SensorReadingsController do

  def create_signed_in_user
    u = FactoryGirl.create(:user)
    sign_in u
    u
  end
  describe '#index' do
    context "with a signed in user" do
      Given(:user) { create_signed_in_user }


    end

  end


  describe '#create' do
    Given(:reading_time) { DateTime.now.utc }
    context "with a signed in user" do
      Given(:user) { create_signed_in_user }
      context "with an existing project" do
        Given(:project) { FactoryGirl.create(:project, user_id: user.id) }
        Given(:posted_index) { 1 }
        Given(:two_readings) { [{time: reading_time - 1.minute, value: 3}, {time: reading_time, value: 1}] }
        Given(:sensors_posted) { [{project_index: posted_index, readings: two_readings}] }
        Given(:new_request) { { project_id: project.id, sensors: sensors_posted } }
        context "a reading for a new sensor" do
          When { post :create, sensorReadings: new_request }

          Then do
            project.reload.sensors.where(project_index: 1).should_not be_nil
          end

          Then do
            SensorReading.count.should == 2
            s = SensorReading.last
            s.should_not be_nil
            s.time.to_s.should == reading_time.to_s
            s.value.should == 1
          end
        end

        context "a reading for an existing sensor" do
          Given(:existing_sensor) { s = project.sensors.build(project_index: 2, name: "door"); project.save; s}
          Given(:posted_index) { existing_sensor.project_index }
          When { post :create, sensorReadings: new_request }
          Then do
            binding.pry
            Sensor.count.should == 1
            project.reload.sensors.where(project_index: existing_sensor.project_index).name.should == existing_sensor.name
          end
          Then do
            SensorReading.count.should == 2
            s = SensorReading.last
            s.should_not be_nil
            s.time.to_s.should == reading_time.to_s
            s.value.should == 1
            s.sensor_id.should == existing_sensor.id
          end
        end
      end
    end
  end


  describe '#destroy' do
    context "with a signed in user" do

    end

  end
end
