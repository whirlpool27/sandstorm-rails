require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) do
    build_stubbed(:product)
  end

  let(:valid_attributes) do
    {
      title: 'something',
      price: 399_000.0,
      user_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      invalid: 'no column'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      allow(Product).to receive(:all).and_return([product])
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      allow(Product).to receive(:find).and_return(product)
      get :show, params: { id: product.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      allow(Product).to receive(:new)
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      allow(Product).to receive(:find).and_return(product)
      get :edit, params: { id: product.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    before(:each) do
      expect(Product).to receive(:new).and_return(product)
    end

    context 'with valid params' do
      before(:each) do
        expect(product).to receive(:save).and_return(true)
      end

      it 'creates a new Product' do
        post :create, params: { product: valid_attributes }, session: valid_session
      end

      it 'redirects to the created product' do
        post :create, params: { product: valid_attributes }, session: valid_session
        expect(response).to redirect_to(product)
      end
    end

    context 'with invalid params' do
      before(:each) do
        expect(product).to receive(:save).and_return(false)
      end

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { product: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    before(:each) do
      allow(Product).to receive(:find).and_return(product)
    end

    context 'with valid params' do
      before(:each) do
        allow(product).to receive(:update).and_return(true)
      end

      it 'updates and redirects to the product' do
        put :update, params: { id: product.to_param, product: valid_attributes }, session: valid_session
        expect(response).to redirect_to(product)
      end
    end

    context 'with invalid params' do
      before(:each) do
        allow(product).to receive(:update).and_return(false)
      end

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: product.to_param, product: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      expect(Product).to receive(:find).and_return(product)
      expect(product).to receive(:destroy)
    end

    it 'destroys product and redirects to the products list' do
      delete :destroy, params: { id: product.to_param }, session: valid_session
      expect(response).to redirect_to(products_url)
    end
  end
end
