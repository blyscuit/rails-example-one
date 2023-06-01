module Api
  module V1
    class SearchTermsController < ApplicationController
      include Pagy::Backend

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
        pagy, keywords = pagy_array(Keyword.all, pagination_params)
        render json: {data: keywords, meta: pagy}
      end

      def pagination_params
        {
          page: params.dig(:number) || Pagy::DEFAULT[:page],
          items: params.dig(:size)
        }
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
