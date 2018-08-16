class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    render json: Merchant.includes(:invoices).find(params[:merchant_id]).invoices
  end
end