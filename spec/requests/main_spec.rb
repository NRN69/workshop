# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Mains', type: :request do
  describe 'GET #index' do
    let(:posts) { create_list :post, 3 }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
      it 'instance var posts include only posts' do
        expect(assigns(:posts)).to match_array(posts)
      end
    end
  end
end
