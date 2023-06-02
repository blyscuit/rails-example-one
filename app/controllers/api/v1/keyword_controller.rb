module Api
  module V1
    class KeywordController < ApplicationController
      skip_before_action :doorkeeper_authorize!
      def crawl
        word = params[:word]
        puts "https://google.com/search?q=#{word}"
        doc = Nokogiri::HTML(URI.open("https://google.com/search?q=#{word}"))
        puts doc.css("div[class='j039Wc']")
        render json: doc.css('div[class="j039Wc"]').count
      end
    end
  end
end
