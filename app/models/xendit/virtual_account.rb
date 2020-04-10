# frozen_string_literal: true

module Xendit
  class VirtualAccount < ApplicationRecord
    alias_attribute :is_closed, :closed
    alias_attribute :is_single_use, :single_use
    alias_attribute :virtual_account_number, :account_number

    ATTRIBUTES = [:id,
                  :is_closed,
                  :is_single_use,
                  :virtual_account_number,
                  :owner_id,
                  :external_id,
                  :bank_code,
                  :merchant_code,
                  :name,
                  :account_number,
                  :expiration_date,
                  :closed,
                  :single_use,
                  :status,
                  # Comming from response when creating a new virtual_account
                  :expected_amount,
                  :description,
                  :currency].freeze
  end
end
