require "rails_helper"

RSpec.describe DoctorprofilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctorprofiles").to route_to("doctorprofiles#index")
    end


    it "routes to #show" do
      expect(:get => "/doctorprofiles/1").to route_to("doctorprofiles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/doctorprofiles").to route_to("doctorprofiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/doctorprofiles/1").to route_to("doctorprofiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/doctorprofiles/1").to route_to("doctorprofiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctorprofiles/1").to route_to("doctorprofiles#destroy", :id => "1")
    end

  end
end
