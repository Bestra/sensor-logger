describe SensorReadingQuery do

  describe "initializing" do


  end


  describe "getting results" do
    context "with a valid project" do
      Given(:project) { FactoryGirl.create(:project) }
      context "with existing sensors and data" do
      Given!(:sensors) do
        project.find_or_create_sensor(1)
        project.find_or_create_sensor(2)
      end

      end
    end
  end
end
