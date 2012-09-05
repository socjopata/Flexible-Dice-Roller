class RollerController < UIViewController
  def viewDidLoad
    #as stated in docs. Do a 'super' or untold havoc will happen. #TODO play with this/examine it a bit.
    super
    
    self.title = "Please roll me a..."
    self.view.backgroundColor = UIColor.whiteColor
    
    
  end
  
end