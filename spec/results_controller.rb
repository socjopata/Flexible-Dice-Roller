
describe "Roller controller view" do
   tests ResultsController
  
   it 'has a Roll again button' do
    view("Roll again!").should.not == nil
  end
  
end