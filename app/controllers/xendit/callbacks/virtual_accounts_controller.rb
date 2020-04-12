# frozen_string_literal: true

require_dependency "xendit/application_controller"

module Xendit::Callbacks
  class VirtualAccountsController < Xendit::ApplicationController
    def update
      xendit_va = Xendit::VirtualAccount.find_or_create_by id: params[:id]
      xendit_va.update!(virtual_account_params)
      head :ok
    end

    def paid
      xendit_va = Xendit::VirtualAccount
        .find_or_initialize_by(
          id: params[:callback_virtual_account_id]
        )
      if xendit_va.new_record?
        xendit_va.assign_attributes(virtual_account_params)
        xendit_va.save!
      end
      Xendit::Payment
        .create!(payment_params.merge(virtual_account: xendit_va))
      head :ok
    end

    private

    def payment_params
      @payment_params ||= params.permit(Xendit::Payment::ATTRIBUTES)
    end

    def virtual_account_params
      @virtual_account_params = params
        .permit(Xendit::VirtualAccount::ATTRIBUTES)
    end
  end
end
