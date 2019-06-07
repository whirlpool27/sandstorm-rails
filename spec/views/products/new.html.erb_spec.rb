require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, Product.new(
                       title: 'MyString',
                       price: '9.99',
                       user: nil
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'input[name=?]', 'product[title]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[user_id]'
    end
  end
end
