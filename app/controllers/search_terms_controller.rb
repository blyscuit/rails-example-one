class SearchTermsController < ApplicationController
  def index
  end
  
  # GET /search_terms
  def index
    @search_terms = SearchTerm.all
  end

  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    CsvImportService.new.call(params[:file])

    redirect_to request.referer, notice: 'Import started...'
  end

  protect_from_forgery except: :show
  def newv
    CsvImportService.new.call(params[:file])
    render json: "OK"
  end
end
