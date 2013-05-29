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
    context "with a signed in user" do
      Given(:user) { create_signed_in_user }
      context "with an existing project" do
        Given(:project) { FactoryGirl.create(:project, user_id: user.id) }
        context "a reading for a new sensor" do
          Given(:reading_time) { DateTime.now.utc }
          Given(:sensors) { [{project_index: 1,
                              readings: [{time: reading_time, value: 1}]
                             }
                            ]
                          }
          Given(:new_request) do
            json = {
              project_id: project.id,
              sensors: sensors
            }
          end

          When { post :create, sensorReadings: new_request }

          Then do
            Project.last.sensors.where(project_index: 1).should_not be_nil
          end

          Then do
            s = SensorReading.last
            s.should_not be_nil
            s.time.to_s.should == reading_time.to_s
            s.value.should == 1
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
