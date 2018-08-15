class Api::V1::Transactions::FindController < ApplicationController
  def show
    render json: Transaction.find_by(find_params)
  end

  def index
    render json: Transaction.where(find_params)
  end

  def find_params
    params.permit(:id, :credit_card_number, :credit_card_expiration_date, :result, :invoice_id, :created_at, :updated_at)
  end
end
