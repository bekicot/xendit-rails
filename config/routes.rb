# frozen_string_literal: true

Xendit::Rails::Engine.routes.draw do
  namespace :callbacks do
    controller :virtual_accounts do
      post "virtual_accounts", action: "update"
      post "virtual_accounts/paid", action: :paid
    end
    controller :invoices do
      post "invoices/paid_or_expired", action: "paid_or_expired"
    end
  end
end
