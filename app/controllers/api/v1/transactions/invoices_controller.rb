class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    render json: Transaction.includes(:invoices).find(params[:transaction_id]).invoice
  end
end
