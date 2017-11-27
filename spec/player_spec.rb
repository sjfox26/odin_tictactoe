require_relative "../lib/player"

RSpec.describe Player do

  context "#initialize" do
    it "is raises an exception when initialized with {}" do
      expect { Player.new({}) }.to raise_error
    end


  end


end