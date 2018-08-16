class Api::V1::InvoiceItems::FindController < ApplicationController
	def show
		render json: InvoiceItem.find_by(find_params)
	end

	def index
		render json: InvoiceItem.where(find_params)
	end

	def find_params
		params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :updated_at, :created_at)
	end
end