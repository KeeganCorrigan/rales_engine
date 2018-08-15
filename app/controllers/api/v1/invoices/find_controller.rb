class Api::V1::Invoices::FindController < ApplicationController
	def show
		render json: Invoice.find_by(find_params)
	end

	def index
		render json: Invoice.where(find_params)
	end

	def find_params
		params.permit(:id, :customer_id, :merchant_id, :status, :updated_at, :created_at)
	end
end