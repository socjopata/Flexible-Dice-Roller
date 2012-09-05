class Dice
  
  def self.roll_a_d(number, &block)
    rand(number.to_i + 1)
  end
  
end