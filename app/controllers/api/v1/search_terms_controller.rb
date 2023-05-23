module Api
  module V1
    class SearchTermsController < ApplicationController
      def import
        return render :json => { :errors => 'No file added' }, :status => 422 if params[:file].nil?
        return render :json => { :errors => 'Only CSV files allowed' }, :status => 422 unless params[:file].content_type == 'text/csv'

        CsvImportService.new.call(params[:file])
        render json: "OK"
      end
    end
  end
end
