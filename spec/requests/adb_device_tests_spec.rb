require 'spec_helper'

describe "AdbDeviceTests" do
  describe "GET /adb_device_tests" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get adb_device_tests_path
      response.status.should be(200)
    end
  end
end
