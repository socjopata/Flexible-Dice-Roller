class Dice
  attr_accessor :result
  
  def initialize(number)
    @result = rand(number.to_i) + 1
  end
  
end