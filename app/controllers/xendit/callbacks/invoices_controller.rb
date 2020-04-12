# frozen_string_literal: true

require_dependency "xendit/application_controller"
require_dependency "xendit/invoice/payment_receiver"
module Xendit
  class Callbacks::InvoicesController < ApplicationController
    def paid_or_expired
      Xendit::Invoice::PaymentReceiver.new(params).perform!
      head 200
    end
  end
end
