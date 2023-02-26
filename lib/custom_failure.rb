# frozen_string_literal: true

class CustomFailure < Devise::FailureApp
  def redirect_url
    user_session_path
  end

  def respond
    if http_auth?
      http_auth
    else
      request_format == :turbo_stream ? redirect : super
    end
  end

  def skip_format?
    %w[html turbo_stream */*].include? request_format.to_s
  end
end