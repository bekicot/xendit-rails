# frozen_string_literal: true

require "test_helper"

module Xendit
  module Callbacks
    class VirtualAccountsControllerTest < ActionDispatch::IntegrationTest
      include Xendit::Rails::Engine.routes.url_helpers
      include ActionDispatch::Assertions::ResponseAssertions
      test "va creation" do
        assert_changes "Xendit::VirtualAccount.count" do
          post callbacks_virtual_accounts_path,
            params: virtual_account_params
          assert_response :success
        end
      end

      test "va paid creates new va" do
        assert_changes "Xendit::VirtualAccount.count" do
          post callbacks_virtual_accounts_paid_path,
            params: paid_virtual_account_params
          assert_response :success
        end
      end

      test "va paid create new payment" do
        assert_changes "Xendit::Payment.count" do
          post callbacks_virtual_accounts_paid_path,
            params: paid_virtual_account_params
          assert_response :success
        end
      end

      def virtual_account_params
        {
          "id": "58a435201b6ce2a355f46070",
          "owner_id": "5824128aa6f9f9b648be9d76",
          "external_id": "fixed-va-1487156410",
          "merchant_code": "88608",
          "account_number": "886081000123456",
          "bank_code": "MANDIRI",
          "name": "John Doe",
          "is_closed": false,
          "expiration_date": "2048-02-15T11:01:52.722Z",
          "is_single_use": false,
          "status": "ACTIVE",
          "created": "2017-02-15T11:01:52.896Z",
          "updated": "2017-02-15T11:01:52.896Z"
        }
      end

      def paid_virtual_account_params
        {
          "updated": "2017-02-15T11:01:52.896Z",
          "created": "2017-02-15T11:01:52.896Z",
          "payment_id": "1487156512722",
          "callback_virtual_account_id": "58a434ba39cc9e4a230d5a2b",
          "owner_id": "5824128aa6f9f9b648be9d76",
          "external_id": "fixed-va-1487156410",
          "account_number": "1001470126",
          "bank_code": "MANDIRI",
          "amount": 80_000,
          "transaction_timestamp": "2017-02-15T11:01:52.722Z",
          "merchant_code": "88464",
          "id": "58a435201b6ce2a355f46070"
        }
      end
    end
  end
end
