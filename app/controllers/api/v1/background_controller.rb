module Api
  module V1
    class BackgroundController < ApplicationController
      skip_before_action :doorkeeper_authorize!

      def index
        render json: Fish.all
      end

      def create
        Fish.destroy_all
        FishJob.perform_later(
          ['tuna', 'salmon', 'tai', 'mackerel']
        )
      end
    end
  end
end
