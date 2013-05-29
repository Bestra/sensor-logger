require 'spec_helper'
describe Project do
  describe "#get_sensors" do
    context "with sensors" do
      Given(:project) { FactoryGirl.create(:project) }
      Given!(:sensors) do
        project.find_or_create_sensor(1)
        project.find_or_create_sensor(2)
      end

      context "with a valid array of integers" do
        When(:result) { project.get_sensors([1,2]) }
        Then { result.map(&:project_index).should include(1,2) }
      end

      context "with a valid array of strings" do
        When(:result) { project.get_sensors(["1","2"]) }
        Then { result.count.should == 2 }
        Then { result.map(&:project_index).should include(1,2) }
      end

      context "with invalid data" do
        When(:result) { project.get_sensors(["1","suerah"]) }
        Then { result.count.should == 1 }
        Then { result.map(&:project_index).should include(1) }
      end

      context "getting a nonexistant sensor" do
        When(:result) { project.get_sensors(["3"]) }
        Then { result.should be_empty}
      end

      context "with an empty array" do
        When(:result) { project.get_sensors([]) }
        Then { result.should be_empty }
      end
    end
  end
end
