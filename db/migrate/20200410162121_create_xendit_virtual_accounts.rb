# frozen_string_literal: true

class CreateXenditVirtualAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :xendit_virtual_accounts, id: :string do |t|
      t.string :owner_id
      t.string :external_id
      t.string :bank_code
      t.string :merchant_code
      t.string :name
      t.string :account_number
      t.datetime :expiration_date
      t.boolean :closed
      t.boolean :single_use
      t.string :status

      # Comming from response when creating a new virtual_account
      t.bigint :expected_amount
      t.text :description
      t.string :currency
      t.timestamps
    end
  end
end
