require "spec_helper"

describe AdbDeviceTestsController do
  describe "routing" do

    it "routes to #index" do
      get("/adb_device_tests").should route_to("adb_device_tests#index")
    end

    it "routes to #new" do
      get("/adb_device_tests/new").should route_to("adb_device_tests#new")
    end

    it "routes to #show" do
      get("/adb_device_tests/1").should route_to("adb_device_tests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/adb_device_tests/1/edit").should route_to("adb_device_tests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/adb_device_tests").should route_to("adb_device_tests#create")
    end

    it "routes to #update" do
      put("/adb_device_tests/1").should route_to("adb_device_tests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/adb_device_tests/1").should route_to("adb_device_tests#destroy", :id => "1")
    end

  end
end
