module Api
  module V1
      class GoogleUsersController < ApplicationController

        skip_before_action :doorkeeper_authorize!, only: %i[create]
    
        def create
          uri = URI.parse("https://www.googleapis.com/oauth2/v3/token")
          auth_params = {
            code: params[:code],
            client_id: ENV['GOOGLE_OAUTH_CLIENT_ID'],
            client_secret: ENV['GOOGLE_OAUTH_CLIENT_SECRET'],
            redirect_uri: 'http://localhost:3000/admins/auth/google_oauth2/callback',
            grant_type: 'authorization_code'
          }
          response = Net::HTTP.post_form(uri, auth_params)
          data = JSON.parse(response.body)

          google = URI.parse('https://www.googleapis.com/oauth2/v3/userinfo?access_token=' +
            data['access_token'])
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
  