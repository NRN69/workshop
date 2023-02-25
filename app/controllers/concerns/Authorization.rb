# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :store_user_location!, if: :storable_location?

    private

    def storable_location?
      request.get? &&
        is_navigational_format? &&
        !devise_controller? &&
        !request.xhr? &&
        !turbo_frame_request?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def set_locale
      I18n.locale = params[:locale]
    end

    def self.default_url_options(options = {})
      options.merge({ locale: I18n.locale })
    end
  end
end
