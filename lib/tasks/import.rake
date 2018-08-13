require 'csv'

namespace :import do
  desc "Import data from sales engine CSVs"

  task sales_engine_data: :environment do

    def seed_data(path, data_type)
      CSV.open(path, headers: true, header_converters: :symbol).each do |row|
        data_type.find_or_create_by(row.to_h)
      end
    end

    seed_data('./db/data/merchants.csv', Merchant)
    puts "There are #{Merchant.count} merchants in the database!"
  end
end
