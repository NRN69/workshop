# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksController, type: :controller do
  login_user

  let(:works) { create_list :work, 3 }
  let(:work) { create :work }
  let(:works_params) do
    {
      work: {
        title: 'Works 1',
        body: 'Information about Work 1'
      }
    }
  end

  context 'GET #show' do
    before { get :index }

    it 'render to index template' do
      is_expected.to render_template :index
    end

    it 'return Works' do
      expect(Work.all).to match_array(works)
    end
  end

  context 'POST #create' do
    subject { post :create, params: works_params }

    it 'Save the Work' do
      expect { subject }.to change(Work, :count).by 1
    end

    it 'redirect to index' do
      expect(subject).to redirect_to action: :index
    end
  end

  context 'with invalid params' do
    let(:works_params) do
      { work: { title: 'W' } }
    end

    it 'not save' do
      expect { subject }.to_not change(Work, :count)
    end

    it 'render new template' do
      get :new
      is_expected.to render_template :new
    end
  end
end