
require 'customer'

describe Customer do

  it{ is_expected.to respond_to :check}

  #why does the test below work?

  it 'can view menu list' do 
    menu = double :menu, items: {"pizza" => 10.5}
    expect(subject.check menu).to eq menu.items
  end

  it 'when selecting dishes, can choose a dish and qty' do
    menu = double :menu
    expect(subject).to respond_to(:select_dishes).with(2).arguments
  end

  it 'reports my pizza order' do
    subject.select_dishes("pizza", 1)

    expect(subject.last_order).to eq({ name: "pizza", quantity: 1, price: 10.5 })
  end

  it 'reports my coke order' do
    subject.select_dishes("coke", 1)

    expect(subject.last_order).to eq({ name: "coke", quantity: 1, price: 1.5 })
  end

  it 'reports my order of coke and pizza' do
    subject.select_dishes("coke", 1)
    subject.select_dishes("pizza", 2)
    expect(subject.order_report).to eq([{ name: "coke", quantity: 1, price: 1.5 },
                                      { name: "pizza", quantity: 2, price: 10.5 }])


  end

# NOTE SURE HOW TO TEST FOR WHETHER THE ITEMS PASSED THROUGH ARE LAST ITEM ON ARRAY
  # it 'can choose more than one meal' do 
  #  allow(subject).to receive(:select_dishes) {[dish,num]}
  #  expect(subject.ordered.last).to eq [dish,num]
  # end

end