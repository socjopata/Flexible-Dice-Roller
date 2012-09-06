class ResultsController < UIViewController

  attr_accessor :number

  def initWithNumber(number)
    initWithNibName(nil, bundle:nil)
    self.number = number
    self #in case of overiding default iOS SDK initializer we need to remember to return self at the end
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    display_results
    button_roll_again
  end

  def display_results
    @label_results = UILabel.alloc.initWithFrame [[0,0] , [160,26]]
    @label_results.text = self.number
    @label_results.font = UIFont.systemFontOfSize(60)
    @label_results.sizeToFit
    @label_results.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 120)

    self.view.addSubview @label_results
  end
  
  def button_roll_again
    @button_roll = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button_roll.setTitle("Roll again!", forState:UIControlStateNormal)
    @button_roll.setTitle("\o/", forState:UIControlStateDisabled)
    @button_roll.sizeToFit
    @button_roll.center = CGPointMake(self.view.frame.size.width / 2, @label_results.center.y + 60)
    @button_roll.addTarget(self, action:'roll_again', forControlEvents:UIControlEventTouchUpInside)
   
    self.view.addSubview @button_roll
  end
  
  def roll_again
    @label_results.text = Dice.new(self.number).result.to_s
  end

end