# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  login_user

  let(:blogs) { create_list :blog, 3 }
  let(:blog) { create :blog }

  let(:blogs_params) do
    {
      blog: {
        title: 'Blog 1',
        body: 'Information about Blog 1'
      }
    }
  end

  context 'GET #show' do
    before { get :index }
    it 'render to index template' do
      is_expected.to render_template :index
    end
    it 'return Blogs' do
      expect(Blog.all).to match_array(blogs)
    end
  end

  context 'POST #create' do
    subject { post :create, params: blogs_params }
    it 'Save the Blog' do
      expect { subject }.to change(Blog, :count).by 1
    end
    it 'redirect to index' do
      expect(subject).to redirect_to action: :index
    end
  end
  context 'with invalid params' do
    let(:blogs_params) do
      { blog: { title: 'B' } }
    end

    it 'not save' do
      expect { subject }.to_not change(Blog, :count)
    end
    it 'render new template' do
      get :new
      is_expected.to render_template :new
    end
  end
end