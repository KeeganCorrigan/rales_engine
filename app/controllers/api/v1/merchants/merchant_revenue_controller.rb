class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  def show
    if params[:date]
      render json: Merchant.find(params[:merchant_id]), serializer: MerchantRevenueDateSerializer, option_name: params[:date]
    else
      render json: Merchant.find(params[:merchant_id]), serializer: MerchantRevenueSerializer
    end
  end

  def find_params
    params.permit(:date)
  end
end
