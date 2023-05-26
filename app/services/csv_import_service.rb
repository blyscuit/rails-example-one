class CsvImportService
    require 'csv'
  
    def call(file, user)
      opened_file = File.open(file)
      options = { headers: true, col_sep: ';' }
      CSV.foreach(opened_file, **options) do |row|
  
        # map the CSV columns to your database columns
        keyword_hash = {}
        keyword_hash[:text] = row['Identifier']
        keyword = Keyword.find_or_create_by!(keyword_hash)

        keyword_user_hash = {}
        keyword_user_hash[:keyword] = keyword
        keyword_user_hash[:user] = user
        KeywordUser.find_or_create_by!(keyword_user_hash)
        # for performance, you could create a separate job to import each user
        # CsvImportJob.perform_later(user_hash)
      end
    end
  end
