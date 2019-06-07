require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    products = [
      build_stubbed(
        :product,
        title: 'Title',
        price: '9.99',
        user: nil
      ),
      build_stubbed(
        :product,
        title: 'Title',
        price: '9.99',
        user: nil
      )
    ]
    assign(:products, products)
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
