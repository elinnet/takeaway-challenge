require 'calculator'

describe Calculator do 


  it 'calculates the total bill from an order' do
      customer = double customer, order_report: [{name: "pizza", quantity: 2, price: 10.5}]
      expect(subject.order_total customer.order_report).to eq 21
  end


  # it 'calculates the total bill from an order' do
  #     expect(subject.order_total).to respond.to(2).arguements
  # end


end
