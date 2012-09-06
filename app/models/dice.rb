class Dice
  attr_accessor :result
  
  def initialize(number)
    @result = rand(number.to_i) + 1
  end
  
  def self.play_sound
    path = NSBundle.mainBundle.pathForResource('dice', ofType:'wav')
    url = NSURL.fileURLWithPath(path)
    error_ptr = Pointer.new(:id)

    @buzzerSound = AVAudioPlayer.alloc.initWithContentsOfURL(url, error:error_ptr)
    @buzzerSound.play   
  end
  
   
end