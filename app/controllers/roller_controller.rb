class RollerController < UIViewController

  def viewDidLoad
    #as stated in docs. Do a 'super' or untold havoc will happen. #TODO play with this/examine it a bit.
    super

    self.title = "Please roll me a..."
    self.view.backgroundColor = UIColor.whiteColor

    input_field
    button_roll
    hint
    
    @button_roll.when(UIControlEventTouchUpInside) do
      roll_a_dice
    end
  end

  def roll_a_dice
    @button_roll.enabled = false
    @input_field.enabled = false
    
    dice_type = @input_field.text
    
    dice = Dice.new(dice_type)
    
    @button_roll.setTitle("Roll!", forState: UIControlStateNormal)
    @button_roll.enabled = true
    @input_field.enabled = true
    
    self.print_result(dice.result.to_s)
  end
  
  def print_result(number)
   #using a custom initializer here. Remember to always call a designated initializer of their superclass, like initWithNibName:bundle: in this case
   Dice.play_sound
   self.navigationController.pushViewController(ResultsController.alloc.initWithNumber(number), animated:true)
  end
  
  def input_field
    @input_field = UITextField.alloc.initWithFrame [ [0,0] , [160,26]]
    @input_field.placeholder = 'input a number here'
    @input_field.textAlignment = UITextAlignmentCenter
    @input_field.autocapitalizationType = UITextBorderStyleRoundedRect
    @input_field.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 120)
    @input_field.keyboardType = UIKeyboardTypeNumbersAndPunctuation
    self.view.addSubview @input_field
  end

  def button_roll
    @button_roll = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button_roll.setTitle("Roll!", forState:UIControlStateNormal)
    @button_roll.setTitle("\o/", forState:UIControlStateDisabled)
    @button_roll.sizeToFit
    @button_roll.center = CGPointMake(self.view.frame.size.width / 2, @input_field.center.y + 40)

    self.view.addSubview @button_roll
  end

  def hint
	   @label_text = UILabel.alloc.initWithFrame([[20, @button_roll.center.y+20], [270, @button_roll.center.y + 60]])
	   @label_text.numberOfLines = 0 # set 0 for word wrap
     @label_text.lineBreakMode = UILineBreakModeWordWrap
     @label_text.setText(hint_text)
	   
     adjustableLabel = UILabel_Adjustable.new({:fontName => "Arial", :fontSize => 16, :msg => hint_text, :labelHeight => 80, :labelWidth => 360.0})
     @label_text.setFont(adjustableLabel.bestFit)
   
     self.view.addSubview @label_text
  end

  def hint_text
    'Hint: think of a dice type you would like to roll, like a d6 or d20. Then put for example 6 or 20 or any number you want in a text box and hit Roll button.'
  end

end