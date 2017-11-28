require_relative "../lib/player"

RSpec.describe Player do
  subject { { :name => 'Lebron James', :letter => 'X' } }

  it { should include(:name) }
  it { should include(:letter, :name) }
  it { should include(:name => 'Lebron James') }
  it { should include(:letter => 'X', :name => 'Lebron James') }


#  context "#initialize" do
#    it "is raises an exception when initialized with {}" do
#      expect { Player.new({}) }.to raise_error
#    end
#    it "initializes all cool" do
#      player1 = Player.new({name: "Lebron James", letter: 'X'})
#      player1.should include(
#                                :name => "Lebron James",
#                                :letter => 'X')
#    end

#  end
end

