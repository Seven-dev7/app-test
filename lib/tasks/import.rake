require 'csv'

desc "Import countries from csv files"
namespace :import do
    task countries: :environment do
        filename = File.join Rails.root, "countries.csv"
        CSV.foreach(filename) do |row|
            country_name = row[4]
            Country.create(country_name: country_name)
        end
    end
end