#it sounds so wrong for a Rails guy, but... at least atm, it's how it is.
describe "Roller controller view" do
   tests RollerController
  
   it 'has a Roll button' do
    view("Roll!").should.not == nil
  end
  
  it 'has an input field' do
    #wish I could assert something on a concrete input field
    views(UITextField).size.should.not == 0
  end
  
  it 'is possible to pick a number' do
    tap views(UITextField).first
    proper_wait 1
    # tried a few things here, to type a number using keyboard but with no luck.
  end
  
  
end
