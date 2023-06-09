module ExternalAuth
  class GoogleAuth
    def initialize(access_code)
      @access_code = access_code
    end

    def app_auth_data
      return {
        client_id: ENV['GOOGLE_OAUTH_CLIENT_ID'],
        client_secret: ENV['GOOGLE_OAUTH_CLIENT_SECRET'],
      }
    end

    def fetch_access_token
      if @access_token.present?
        @access_token
      else
        uri = URI.parse("https://www.googleapis.com/oauth2/v3/token")
        params = {
          code: @access_code,
          client_id: app_auth_data[:client_id],
          client_secret: app_auth_data[:client_secret],
          redirect_uri: 'http://localhost:3000/admins/auth/google_oauth2/callback',
          grant_type: 'authorization_code'
        }
        response = Net::HTTP.post_form(uri, params)
        data = JSON.parse(response.body)
        if data['access_token'].present?
          @access_token ||= data['access_token']
        else
          nil
        end
      end
    end

    def user_data
      access_token = fetch_access_token
      if access_token.present?
        google = URI.parse('https://www.googleapis.com/oauth2/v3/userinfo?access_token=' +
          access_token)
        response = Net::HTTP.get_response(google)
        JSON.parse(response.body)
      else
        nil
      end
    end

    def get_user!
      access_token = fetch_access_token
      if access_token.present?
        google = URI.parse('https://www.googleapis.com/oauth2/v3/userinfo?access_token=' +
          access_token)
        response = Net::HTTP.get_response(google)
        JSON.parse(response.body)
      else
        nil
      end
    end
  end
end
