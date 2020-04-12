# frozen_string_literal: true

require "test_helper"

module Xendit
  class Callbacks::InvoicesControllerTest < ActionDispatch::IntegrationTest
    include Xendit::Rails::Engine.routes.url_helpers
    include ActionDispatch::Assertions::ResponseAssertions

    test "sample data from xendit callback" do
      post callbacks_invoices_paid_or_expired_path,
        params: params_from_callbacks_page
      assert_response :success
    end

    test "created Xendit::InvoicePayment" do
      assert_changes "Xendit::InvoicePayment.count" do
        post callbacks_invoices_paid_or_expired_path,
          params: params_from_callbacks_page
      end
    end

    test "created Xendit::Invoice" do
      assert_changes "Xendit::Invoice.count" do
        post callbacks_invoices_paid_or_expired_path,
          params: params_from_callbacks_page
      end
    end

    test "created Xendit::Recurring" do
      assert_changes "Xendit::Recurring.count" do
        post callbacks_invoices_paid_or_expired_path,
          params: params_for_recurring_payment_via_credit_card
      end
    end

    private

    def params_from_callbacks_page
      {
        "id": "579c8d61f23fa4ca35e52da4",
        "external_id": "invoice_123124123",
        "user_id": "5781d19b2e2385880609791c",
        "is_high": true,
        "payment_method": "BANK_TRANSFER",
        "status": "PAID",
        "merchant_name": "Xendit",
        "amount": 50_000,
        "paid_amount": 50_000,
        "bank_code": "PERMATA",
        "paid_at": "2016-10-12T08:15:03.404Z",
        "payer_email": "wildan@xendit.co",
        "description": "This is a description",
        "adjusted_received_amount": 47_500,
        "fees_paid_amount": 0,
        "updated": "2016-10-10T08:15:03.404Z",
        "created": "2016-10-10T08:15:03.404Z",
        "currency": "IDR",
        "payment_channel": "PERMATA",
        "payment_destination": "888888888888"
      }
    end

    def params_for_recurring_payment_via_credit_card
      {
        "id": "5e935718279e3d46f0e2c740",
        "external_id": "Recurring Tester-1586714392760",
        "user_id": "5e90dc3147071338fc7f12d3",
        "is_high": false,
        "credit_card_charge_id": "5e93579a1c3e300019b32e44",
        "payment_method": "CREDIT_CARD",
        "status": "PAID",
        "merchant_name": "Upwork Freelancer",
        "amount": 100_000,
        "paid_amount": 100_000,
        "paid_at": "2020-04-12T17:59:52.834Z",
        "payer_email": "xendit.co@mailinator.com",
        "description": "Recurring Payment",
        "adjusted_received_amount": 100_000,
        "success_redirect_url": "https://2461efd5.ngrok.io",
        "failure_redirect_url": "https://2461efd5.ngrok.io/rails/info",
        "created": "2020-04-12T17:59:52.835Z",
        "updated": "2020-04-12T18:02:02.675Z",
        "recurring_payment_id": "5e935718279e3d46f0e2c73f",
        "currency": "IDR",
        "payment_channel": "CREDIT_CARD",
        "controller": "xendit/callbacks/invoices",
        "action": "paid_or_expired"
      }
    end
  end
end
