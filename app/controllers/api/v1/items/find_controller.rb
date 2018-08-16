class Api::V1::Items::FindController < ApplicationController
	def show
		render json: Item.find_by(find_params)
	end

	def index
		render json: Item.where(find_params), each_serializer: ItemSerializer
	end

	def find_params
		params[:unit_price] = string_to_number(params[:unit_price]) if params[:unit_price].respond_to?(:to_str)
		params.permit(:id, :name, :merchant_id, :description, :unit_price, :updated_at, :created_at)
	end
end
