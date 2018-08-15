class Api::V1::Customers::FindController < ApplicationController

  def show
    render json: Customer.find_by(find_params)
  end

  def find_params
    params.permit(:first_name, :last_name, :id, :updated_at, :created_at)
  end
end
