# frozen_string_literal: true

class CreateXenditPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :xendit_payments, id: :string do |t|
      t.bigint :amount
      t.datetime :transaction_timestamp
      t.references :virtual_account,
                   foreign_key: { to_table: :xendit_virtual_accounts },
                   type: :string
      t.timestamps
    end
  end
end
