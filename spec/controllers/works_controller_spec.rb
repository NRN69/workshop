# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksController, type: :controller do
  describe 'GET #show' do
    let(:works) { create :work }

    subject { get :show, params: { id: @work.id } }

    context 'show work' do
      it 'render show view' do
        is_expected.to render_template :show
      end
    end
  end
end