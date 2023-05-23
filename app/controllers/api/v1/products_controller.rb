module Api
  module V1
    class ProductsController < ApplicationController
      def show
        render json: SearchTerm.all
      end
    end
  end
end
