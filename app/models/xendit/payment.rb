# frozen_string_literal: true

module Xendit
  class Payment < ApplicationRecord
    alias_attribute :callback_virtual_account_id, :virtual_account_id
    alias_attribute :payment_id, :id

    ATTRIBUTES = %i[amount transaction_timestamp
                    payment_id
                    callback_virtual_account_id].freeze

    belongs_to :virtual_account
  end
end
