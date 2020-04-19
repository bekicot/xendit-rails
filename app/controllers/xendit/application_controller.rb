# frozen_string_literal: true

module Xendit
  # Xendit's base controller
  class ApplicationController < ActionController::API
    before_action :verify_token!

    private

    def verify_token!
      return true if token_valid?

      head :unauthorized
      false
    end

    def token_valid?
      callback_token = Xendit.callback_token
      if Xendit.callback_token.nil?
        raise XenditTokenNotConfiguredError, "Callback token is not set."
      end

      request.headers["x-callback-token"] == callback_token
    end
  end
  class XenditTokenNotConfiguredError < StandardError; end
end
