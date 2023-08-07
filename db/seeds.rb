require 'csv'
# We are using the activerecord-import gem here to speed up the seeding process
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/postgresql_adapter'

puts "Importing dataset into database (this may take a minute)..."

csv_path = 'db/dataset.csv'
csv_config = { quote_char: '"', col_sep: ';', row_sep: "\r\n" }
prompt_texts = []

CSV.foreach(csv_path, **csv_config) { |row| prompt_texts << [row.first] }
Prompt.bulk_import([:text], prompt_texts)

# This will create the elasticsearch index if it doesn't exist
# and create documents for the new seed data
puts "Creating documents in elasticsearch..."
Prompt.__elasticsearch__.import(force: true)

puts "Database seeding complete!"
