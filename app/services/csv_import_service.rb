class CsvImportService
    require 'csv'
  
    def call(file)
      opened_file = File.open(file)
      options = { headers: true, col_sep: ';' }
      CSV.foreach(opened_file, **options) do |row|
  
        # map the CSV columns to your database columns
        user_hash = {}
        user_hash[:keyword] = row['Identifier']
  
        SearchTerm.find_or_create_by!(user_hash)
        # for performance, you could create a separate job to import each user
        # CsvImportJob.perform_later(user_hash)
      end
    end
  end
