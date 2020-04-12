# frozen_string_literal: true

class CreateXenditInvoicePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :xendit_invoice_payments do |t|
      t.string :user_id
      t.string :external_id
      t.boolean :high
      t.string :merchant_name
      t.bigint :amount
      t.string :status
      t.string :payer_email
      t.text :description
      t.bigint :fees_paid_amount
      t.bigint :adjusted_received_amount
      t.string :bank_code
      t.string :retail_outlet_name
      t.string :ewallet_type
      t.string :on_demand_link
      t.string :recurring_payment_id
      t.bigint :paid_amount
      t.string :mid_label
      t.string :currency
      t.string :success_redirect_url
      t.string :failure_redirect_url
      t.datetime :paid_at
      t.string :credit_card_charge_id
      t.string :payment_method
      t.string :payment_channel
      t.string :payment_destination

      t.references :invoice
      t.timestamps
    end
  end
end
