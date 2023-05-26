module Api
  module V1
    class UserController < ApplicationController
      # GET /me.json
      def me
        render json: current_user
      end
    end
  end
end
