# frozen_string_literal: true

Xendit::Rails::Engine.routes.draw do
  namespace :callbacks do
    controller :virtual_accounts do
      post 'virtual_accounts', action: 'update'
      post 'virtual_accounts/paid', action: :paid
    end
  end
end
