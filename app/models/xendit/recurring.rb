# frozen_string_literal: true

module Xendit
  class Recurring < ApplicationRecord
    alias_attribute :should_send_email, :send_email
    ATTRIBUTES = %i[id
                    user_id
                    external_id
                    status
                    amount
                    payer_email
                    description
                    send_email
                    interval
                    interval_count
                    total_recurrence
                    recurrence_progress
                    last_created_invoice_url
                    credit_card_token
                    success_redirect_url
                    failure_redirect_url
                    invoice_duration
                    charge_immediately
                    recharge].freeze

    has_many :invoices
  end
end
