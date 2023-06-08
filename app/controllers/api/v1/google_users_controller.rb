module Api
  module V1
      class GoogleUsersController < ApplicationController

        skip_before_action :doorkeeper_authorize!, only: %i[create]
    
        def create
          google = URI.parse('https://www.googleapis.com/oauth2/v3/userinfo?access_token=' +
            params[:token])
          response = Net::HTTP.get_response(google)
          data = JSON.parse(response.body)

          user = User.new(email: data['email'], password: data['sub'])
          if user.save
            render json: 'Success'
          else
            render(json: { error: user.errors.full_messages }, status: 422)
          end
        end
      end
    end
  end
  