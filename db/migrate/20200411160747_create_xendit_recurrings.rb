# frozen_string_literal: true

class CreateXenditRecurrings < ActiveRecord::Migration[6.0]
  def change
    create_table :xendit_recurrings, id: :string do |t|
      t.string :user_id
      t.string :external_id
      t.string :status
      t.string :amount
      t.string :payer_email
      t.text :description
      t.boolean :send_email
      t.string :interval
      t.integer :interval_count
      t.integer :total_recurrence
      t.integer :recurrence_progress
      t.string :last_created_invoice_url
      t.string :credit_card_token
      t.string :success_redirect_url
      t.string :failure_redirect_url
      t.integer :invoice_duration
      t.boolean :charge_immediately
      t.boolean :recharge
      t.timestamps
    end
  end
end
