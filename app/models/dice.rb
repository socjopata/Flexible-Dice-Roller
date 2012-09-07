class Dice
  attr_accessor :result
  
  def initialize(number)
    @result = rand(number.to_i) + 1
  end
  
  def self.play_sound
    path = NSBundle.mainBundle.pathForResource('dice', ofType:'wav')
    url = NSURL.fileURLWithPath(path)
    error_ptr = Pointer.new(:id)

    @dice_roll_sound = AVAudioPlayer.alloc.initWithContentsOfURL(url, error:error_ptr)
    
    #rewritting from obj-c
    # AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    #[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    #[[AVAudioSession sharedInstance] setActive: YES error: nil];
    #[[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    #[audioPlayer play];

    AVAudioSession.sharedInstance.setCategory(AVAudioSessionCategoryPlayback, error:nil)
    AVAudioSession.sharedInstance.setActive(true, error:nil)
    
    @dice_roll_sound.play   
  end
  
   
end