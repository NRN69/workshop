# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #show' do
    let(:posts) { create :post }

    subject { get :show, params: { id: @post.id } }

    context 'show post' do
      it 'render show view' do
        is_expected.to render_template :show
      end
    end
  end
end