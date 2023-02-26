# # frozen_string_literal: true
#
# require 'rails_helper'
#
# describe 'User signs up', type: :system do
#   let(:email) { FFaker::Internet.email }
#   let(:password) { FFaker::Internet.password }
#
#   before do
#     visit new_user_registration_path
#   end
#
#   scenario 'with valid data' do
#     fill_in 'user_email', with: email
#     fill_in 'user_password', with: password
#     click_button I18n.t('devise.registrations.new.button')
#
#     expect(page).to have_no_link I18n.t('menu.auth.sign_in.exit')
#   end
# end