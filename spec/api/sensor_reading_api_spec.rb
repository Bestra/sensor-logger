describe "User with token saving data" do
  Given(:user) { u = FactoryGirl.create(:user); u.reset_authentication_token! }
  context "with a project and a sensor" do
    Given!(:setup) do
      p = FactoryGirl.create(:project)
      p.sensors = [FactoryGirl.create(:sensor)]
      p.save
      user.projects = [p]
      user.save
    end

  end


  it "creates a new sensor in the project"
  it "saves the data with the new sensor"
end
