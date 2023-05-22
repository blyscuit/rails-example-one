class Api::V1::ProductsController < Api::V1::ApplicationController
  def show
    render json: SearchTerm.all
  end
end
