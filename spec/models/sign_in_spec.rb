# frozen_string_literal: true

require 'rails_helper'

describe 'User signs in', type: :system do
  before do
    @user = create :user
    visit new_user_session_path
  end

  scenario 'valid with correct credentials' do
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button I18n.t('devise.sessions.new.button')

    expect(page).to have_text I18n.t('devise.sessions.signed_in')
  end

  scenario 'invalid with unregistered account' do
    fill_in 'user_email', with: FFaker::Internet.email
    fill_in 'user_password', with: 'FakePassword123'
    click_button I18n.t('devise.sessions.new.button')

    expect(page).to have_no_text I18n.t('devise.sessions.signed_in')
    expect(page).to have_no_link I18n.t('menu.auth.sign_in.exit')
  end

  scenario 'invalid with invalid password' do
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'FakePassword123'
    click_button I18n.t('devise.sessions.new.button')

    expect(page).to have_no_text I18n.t('devise.sessions.signed_in')
    expect(page).to have_no_link I18n.t('menu.auth.sign_in.exit')
  end
end