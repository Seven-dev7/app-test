require 'csv'

desc "Import from csv files"
namespace :import do

    desc "Import countries from csv files"
    task countries: :environment do
        filename = File.join Rails.root, "countries.csv"
        CSV.foreach(filename) do |row|
            Country.create(code: row[1], alpha_2: row[2], alpha_3: row[3], name_fr: row[4], name_en: row[5])
        end
        p "Pays importés"
    end

    desc "Import french embassy from csv files"
    task embassies: :environment do
        filename = File.join Rails.root, "embassy.csv"
        CSV.foreach(filename) do |row|
            data = row[0].split(';')
            Embassy.create(in_country: data[1] , latitude: data[2], longitude: data[3], gps: data[4])
        end
        p "Ambassades importées"
    end

    desc "Import foreigners from csv files"
    task foreigners: :environment do
        filename = File.join Rails.root, "french-foreigners.csv"
        CSV.foreach(filename) do |row|
            p row
            # Country.foreigners.update(year: , number_of_french: )
        end
        p "francais a l'étranger importés"
    end

    desc "Import all from csv files"
    task :all => [:countries, :embassies] do
        p "import pays et ambassades"
    end

end