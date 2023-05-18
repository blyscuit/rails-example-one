class ExclusiveController < ApplicationController
    before_action :authenticate_user!

    def exclusive
    end  
end
