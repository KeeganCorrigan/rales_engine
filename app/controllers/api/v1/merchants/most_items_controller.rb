class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.most_items(params[:quantity])
  end

  def find_params
    params.permit(:quantity)
  end
end
