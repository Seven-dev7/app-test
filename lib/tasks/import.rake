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
        Embassy.destroy_all
        p "empty table embassy before importing"
        counter = 0
        counter2 = 0
        CSV.foreach(filename) do |row|
            next if row == CSV.foreach(filename).first
            counter += 1
            data = row[0].split(';')
            begin
                country = Country.all.detect{ |country| country.name_fr.downcase == data[1].downcase }
                Embassy.create!(in_country: data[1], latitude: data[2], longitude: data[3], gps: data[4], country_id: country.id)
                counter2 += 1
            rescue => e
                p e
            end
        end
        p "#{counter2}Ambassades importées sur #{counter}"
    end

    desc "Import foreigners from csv files"
    task foreigners: :environment do
        filename = File.join Rails.root, "french-foreigners.csv"
        counter = 0
        counter2 = 0
        Foreigner.destroy_all
        p "Last db Foreigner destroy"
        CSV.foreach(filename) do |row|
            next if row == CSV.foreach(filename).first
            counter += 1
            data = row[0].split(';')
            begin
                country = Country.all.detect{ |country| country.name_fr.downcase == data[0].downcase }
                Foreigner.create!(country_name: data[0], year: data[1], number_of_french: data[2], country_id: country.id)
                counter2 +=1
            rescue => e
                p e
            end
        end
        p "#{counter2}foreigner importées sur #{counter}"
    end

    desc "Import all from csv files"
    task :all => [:countries, :embassies, :foreigners] do
        p "import pays, ambassades, foreigners"
    end

end