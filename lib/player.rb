class Player
  attr_reader :name, :letter

  def initialize(input)
    @name = input.fetch(:name)
    @letter = input.fetch(:letter)
  end

end