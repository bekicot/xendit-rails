# frozen_string_literal: true

class CreateXenditInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :xendit_invoices, id: :string do |t|
      t.string :user_id
      t.string :external_id
      t.string :status
      t.string :merchant_name
      t.string :merchant_profile_picture_url
      t.bigint :amount
      t.string :payer_email
      t.text :description
      t.string :invoice_url
      t.datetime :expiry_date
      t.text :available_banks
      t.text :available_retail_outlets
      t.boolean :exclude_credit_card
      t.boolean :send_email
      t.text :mid_label
      t.string :currency
      t.datetime :paid_at
      t.string :credit_card_charge_id
      t.string :payment_method
      t.string :payment_channel
      t.string :payment_destination
      t.string :success_redirect_url
      t.string :failure_redirect_url
      t.string :fixed_va
      t.references :recurring
      t.timestamps
    end
  end
end
