class Api::V1::MerchantRevenueController < ApplicationController
  def show
    render json: Merchant.find(params[:merchant_id]), serializer: MerchantRevenueSerializer
  end
end