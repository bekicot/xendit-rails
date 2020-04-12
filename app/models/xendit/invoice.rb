# frozen_string_literal: true

module Xendit
  class Invoice < ApplicationRecord
    alias_attribute :should_exclude_credit_card, :exclude_credit_card
    alias_attribute :should_send_email, :send_email
    alias_attribute :recurring_payment_id, :recurring_id

    ATTRIBUTES = %i[recurring_id
                    user_id
                    external_id
                    status
                    merchant_name
                    merchant_profile_picture_url
                    amount
                    payer_email
                    description
                    invoice_url
                    expiry_date
                    available_banks
                    available_retail_outlets
                    exclude_credit_card
                    send_email
                    mid_label
                    currency
                    paid_at
                    credit_card_charge_id
                    payment_method
                    payment_channel
                    payment_destination
                    success_redirect_url
                    failure_redirect_url
                    fixed_va].freeze

    belongs_to :recurring, optional: true
  end
end
