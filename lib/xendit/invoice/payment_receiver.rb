# frozen_string_literal: true

class Xendit::Invoice::PaymentReceiver
  def initialize(xendit_params)
    @xendit_params = xendit_params
  end

  def perform!
    create_or_update_recurring! if xendit_params[:recurring_payment_id]
    create_or_update_invoice!
    create_xendit_payment!
  end

  private

  attr_reader :xendit_params

  def create_or_update_recurring!
    recurring = Xendit::Recurring
      .find_or_create_by(id: xendit_params[:recurring_payment_id])
    recurring.update!(xendit_params.permit(Xendit::Recurring.allowed_attributes))
  end

  def create_or_update_invoice!
    invoice = Xendit::Invoice
      .find_or_create_by(id: xendit_params[:id])
    invoice.update!(xendit_params.permit(Xendit::Invoice.allowed_attributes))
  end

  def create_xendit_payment!
    Xendit::InvoicePayment.create!(xendit_payment_params)
  end

  def xendit_payment_params
    xendit_params
      .permit(Xendit::InvoicePayment.allowed_attributes)
      .merge(invoice_id: xendit_params[:id])
  end
end
