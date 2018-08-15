class Api::V1::Items::FindController < ApplicationController
	def show
		render json: Item.find_by(find_params)
	end

	def index
		render json: Item.where(find_params)
	end

	def find_params
		params.permit(:id, :name, :merchant_id, :description, :unit_price, :updated_at, :created_at)
	end
end