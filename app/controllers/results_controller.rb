class ResultsController < UIViewController

  attr_accessor :number

  def initWithNumber(number)
    initWithNibName(nil, bundle:nil)
    self.number = number
    self #in case of overiding default iOS SDK initializer we need to remember to return self at the end
  end
end