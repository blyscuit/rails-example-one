class HomeController < ApplicationController
    def index
        if Rails.env.production?
            @text = "My App"
        else
            @text = "My App #{Rails.env}"
        end
    end
end
