require 'csv'

desc "Import from csv files"
namespace :import do
    desc "Import countries from csv files"
    task countries: :environment do
        filename = File.join Rails.root, "countries.csv"
        CSV.foreach(filename) do |row|
            country_name = row[4]
            Country.create(country_name: country_name)
        end
    end

    desc "Import french embassy from csv files"
    task embassies: :environment do
        filename = File.join Rails.root, "embassy.csv"
        CSV.foreach(filename) do |row|
            data = row[0].split(';')
            in_country = data[1]
            Embassy.create(in_country: in_country)
        end
    end

    desc "Import all from csv files"
    task :all => [:countries, :embassies]
end