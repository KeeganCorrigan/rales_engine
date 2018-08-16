class Api::V1::InvoiceItems::FindController < ApplicationController

	def show
		render json: InvoiceItem.find_by(find_params)
	end

	def index
		render json: InvoiceItem.where(find_params), each_serializer: InvoiceItemSerializer
	end

	def find_params
		params[:unit_price] = string_to_number(params[:unit_price]) if params[:unit_price].respond_to?(:to_str)
		params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :updated_at, :created_at)
	end
end
