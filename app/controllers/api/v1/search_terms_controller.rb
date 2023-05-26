module Api
  module V1
    class SearchTermsController < ApplicationController
      def import
        return render :json => { :errors => 'No file added' }, :status => 422 if params[:file].nil?
        return render :json => { :errors => 'Only CSV files allowed' }, :status => 422 unless params[:file].content_type == 'text/csv'

        CsvImportService.new.call(params[:file], current_user)
        render json: "OK"
      end

      def match
        render json: KeywordUser.all
      end

      def words
        render json: Keyword.all
      end

      def my_words
        render json: 
        Keyword.where(
          id: KeywordUser.where(
            user_id: current_user.id 
          )
          .map(&:keyword_id)
        )
      end
    end
  end
end
