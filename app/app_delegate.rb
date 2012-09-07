class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    return_early_if_this_is_a_test
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.makeKeyAndVisible # <- 'this window will receive taps, shakes and you name it'
    
    #initiate controller here. initWithNibName thing comes from the fact that typically, this is used to load a controller from a NIB file.
    #NIBs are created using Xcode's Interface Builder as a way of visually constructing views.
    #we are passing a nil twice because we are not using Interface Builder for our stuff.
    @dice_roller = RollerController.alloc.initWithNibName(nil, bundle: nil)
    #... and put it into standard iOS container
    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@dice_roller) 
    
    #UIWindow have a rootViewController property for displaying controllers. #Now it's time to set it up:
    @window.rootViewController = @navigation_controller #the @window takes the UIViewController instance(our dice roller) and adjusts IT'S view size to the window. Neat
    
    true
  end
  
  def return_early_if_this_is_a_test
    return true if RUBYMOTION_ENV == 'test'
  end
  
end
