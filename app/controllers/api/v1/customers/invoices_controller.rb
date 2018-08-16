class Api::V1::Customers::IvoicesController < ApplicationController
  def index
    render json: Customer.includes(:invoices).find(params[:customer_id]).invoices
  end
end