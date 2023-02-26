# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
      # it 'instance var posts include only posts' do
      #   expect(assigns(:posts)).to match_array(posts)
      # end
      # it 'instance var works include only works' do
      #   expect(assigns(:works)).to match_array(works)
      # end
    end
  end
end
