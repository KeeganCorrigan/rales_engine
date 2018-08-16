class Api::V1::Merchants::RevenueByDateController < ApplicationController
  def show
    render json: Merchant.all, serializer: MerchantsRevenueByDateSerializer, option_name: params[:date]
  end
end